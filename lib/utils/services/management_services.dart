part of 'services.dart';

class ManagementService {
  List<ManagementStoreModel> _data = [];

  // get data store
  Future<List<ManagementStoreModel>> getStore() async {
    var response = await http.get(Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var result =
          json.decode(response.body)['data'].cast<Map<dynamic, dynamic>>();

      _data = result
          .map<ManagementStoreModel>(
              (json) => ManagementStoreModel.fromJsonn(json))
          .toList();

      return _data;
    } else {
      throw Exception('Failed get data');
    }
  }

  Future<bool> createStore(String title, String description, String price, String stock) async {
    var response = await http.post(Uri.parse('$baseUrl/products/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'price': price,
          'stock': stock,
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
