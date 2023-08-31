// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lat_project_isa/modules/management_product/management_store_model.dart';
import 'package:lat_project_isa/utils/services/services.dart';

class HalamanUtamaScreen extends StatefulWidget {
  const HalamanUtamaScreen({super.key, this.title, this.id});
  final String? title;
  final int? id;

  @override
  State<HalamanUtamaScreen> createState() => _HalamanUtamaScreenState();
}

class _HalamanUtamaScreenState extends State<HalamanUtamaScreen> {
  bool editForm = false;
  bool result = false;

  // menyimpan hasil inputan
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();

  ManagementService managementService = ManagementService();
  late Future<List<ManagementStoreModel>> futureManagement;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureManagement = managementService.getStore();
  }

  // onGoBack(dynamic value) {
  //   setState(() {
  //     futureManagement = managementService.getStore();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${editForm ? "Perbarui" : "Tambah"} data"),
          backgroundColor: Colors.teal,
          actions: const [],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: title,
                decoration: const InputDecoration(
                    labelText: "Nama Barang :", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: description,
                decoration: const InputDecoration(
                    labelText: 'Deskripsi Barang :',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: price,
                decoration: const InputDecoration(
                    labelText: "Harga Barang :", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: stock,
                decoration: const InputDecoration(
                    labelText: "Stock Barang :", border: OutlineInputBorder()),
              ),
            ),
            TextButton(
                onPressed: () async {
                  result = await managementService.createStore(
                      title.text, description.text, price.text, stock.text);
                  if (result) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Simpan'))
          ],
        ));
  }
}
