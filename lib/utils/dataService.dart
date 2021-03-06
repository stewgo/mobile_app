import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  // For production:
  //static const URL = 'https://p48o31wsud.execute-api.ap-southeast-2.amazonaws.com';

  // For physical device:
  //static const URL = 'localhost:5000';

  // For emulator:
  static const URL = '10.0.2.2';

  dynamic getProducts() async {
     final response = await http.get(new Uri.http(URL, 'products', { 'include': 'merchant', 'availableOnly': 'true' }));

     return json.decode(response.body);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(
        new Uri.http(URL, 'login'),
        body: json.encode({'username': username, 'password': password }),
        headers: headers
    );

    return new Map<String, dynamic>.from(json.decode(response.body));
  }

  Future<Map<String, dynamic>> orderProduct(int productId, String accessToken) async {
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var response = await http.post(
        new Uri.http(URL, 'orders'),
        body: json.encode({'productId': productId }),
        headers: headers
    );

    final id = json.decode(response.body)['id'];

    response = await http.get(
        new Uri.http(URL, 'orders/$id', { 'include': 'product,product.merchant'}),
        headers: headers
    );

    return new Map<String, dynamic>.from(json.decode(response.body));
  }

  String getImageUrl(String fileName) {
    return "https://assets.stewgo.com.au/products/$fileName";
  }
}
