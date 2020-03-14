import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  static const USE_RESTFUL_API = false;
  // For production:
  //static const URL = 'https://p48o31wsud.execute-api.ap-southeast-2.amazonaws.com';

  // For physical device:
  static const URL = 'localhost:5000';

  // For emulator:
  //static const URL = '10.0.2.2:8888';

  dynamic getMeals() async {
    if (USE_RESTFUL_API) {
      return this.getMealsFromAPI();
    } else {
      return this.getMealsFromDummyData();
    }
  }

  dynamic getMealsFromAPI() async {
     final response = await http.get(new Uri.http(URL, 'meals'));
     print(response.body);

     return json.decode(response.body);
  }

  dynamic getMealsFromDummyData() async {
    return Future<dynamic>.delayed(Duration(seconds: 1), () {
      return [
        {"Merchant":"Papa Johns","Description":"Yummy pizza","ID":2,"Name":"Pizza"},
        {"Merchant":"John Smith","Description":"Spaghetti with mince in a tomato sauce.","ID":1,"Name":"Spaghetti Bolognese"},
        {"Merchant":"John Connor Smith Long Name","Description":"Pork dumplings long lorem ipsum.... long description... long description... final","ID":3,"Name":"Pork Dumplings"},
        {"Merchant":"Max","Description":"Classic dish","ID":4,"Name":"Fish and Chips"},
      ];
    });
  }
  // TODO Michal: make this used
  String getImageUrl(int id) {
    return "https://assets.stewgo.com.au/meals/${id}.jpg";
  }

// {"Items":[{"Seller":"Papa Johns","Description":"Yummy pizza","ID":2,"Name":"Pizza"},{"Seller":"John Smith","Description":"Spaghetti with mince in a tomato sauce.","ID":1,"Name":"Spaghetti Bolognese"}],"Count":2,"ScannedCount":2}
}
