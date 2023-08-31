import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:lat_project_isa/modules/management_product/management_store_model.dart';
part 'management_services.dart';


Client http = Client();
String baseUrl = 'https://dummyjson.com';