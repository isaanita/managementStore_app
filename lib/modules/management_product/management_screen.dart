// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lat_project_isa/modules/management_product/management_store_model.dart';
import 'package:lat_project_isa/utils/services/services.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  ManagementService managementService = ManagementService();
  late Future<List<ManagementStoreModel>> futureManagement;

  @override

// get data dari file management_services.dart
  void initState() {
    super.initState();

    futureManagement = managementService.getStore();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: futureManagement,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                    'Nama Barang : ${snapshot.data![index].title}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'Deskripsi Barang : ${snapshot.data![index].description}'),
                                Text(
                                    'Harga Barang : ${snapshot.data![index].price}'),
                                Text(
                                    'Stock Barang : ${snapshot.data![index].stock}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Loading...'),
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
