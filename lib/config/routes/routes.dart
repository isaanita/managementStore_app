import 'package:flutter/material.dart';
import 'package:lat_project_isa/modules/halaman_utama/halaman_utama_screen.dart';
import 'package:lat_project_isa/modules/management_product/management_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        String? data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => HalamanUtamaScreen(title: data));
      case '/products':
        return MaterialPageRoute(
          builder: (_) => const ManagementScreen(),
        );
      case '/products/add':
        int? id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => HalamanUtamaScreen(id: id));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text("Tidak ada route ${settings.name}")),
                ));
    }
  }
}
