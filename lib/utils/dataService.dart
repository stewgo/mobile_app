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
     final response = await http.get(new Uri.http(URL, 'products'));
     print(response.body);

     return json.decode(response.body);
  }

  String getImageUrl(String fileName) {
    return "https://assets.stewgo.com.au/products/${fileName}";
  }
}
