import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  static const USE_RESTFUL_API = false;
  // For production:
  //static const URL = 'https://p48o31wsud.execute-api.ap-southeast-2.amazonaws.com';

  // For physical device:
  //static const URL = 'localhost:5000';

  // For emulator:
  static const URL = '10.0.2.2:8888';

  dynamic getMeals() async {
    if (USE_RESTFUL_API) {
      return this.getMealsFromAPI();
    } else {
      return this.getMealsFromDummyData();
    }
  }

  dynamic getMealsFromAPI() async {
     final response = await http.get(new Uri.http(URL, 'products'));
     print(response.body);

     return json.decode(response.body);
  }

  dynamic getMealsFromDummyData() async {
    return Future<dynamic>.delayed(Duration(seconds: 1), () {
      return [{
        "id": 1,
        "productName": "Spaghetti bolognese",
        "merchantName": "John Smith",
        "price": "8.50",
        "availableDate": "8pm",
        "description": "Spaghetti with mince beef and tomato sauce"
      }, {
        "id": 2,
        "productName": "Pizza",
        "merchantName": "John Smith",
        "price": "12.00",
        "availableDate": "5pm",
        "description": "Pizza with cheesee and pepperoni"
      }, {
        "id": 3,
        "productName": "Pork dumplings",
        "merchantName": "John Smith",
        "price": "9.50",
        "availableDate": "7pm",
        "description": "Pork dumplings lorem ispum long long long"
      }, {
        "id": 4,
        "productName": "Fish and Chips",
        "merchantName": "John Smith",
        "price": "11.00",
        "availableDate": "9pm",
        "description": "Snapper fish with chips that with chicken salt"
      }];
    });
  }
  // TODO Michal: make this used
  String getImageUrl(int id) {
    return "https://assets.stewgo.com.au/meals/${id}.jpg";
  }
}
