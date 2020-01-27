import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  // For production:
  //static const URL = 'https://p48o31wsud.execute-api.ap-southeast-2.amazonaws.com';

  // For physical device:
  static const URL = 'localhost:5000';
  // For emulator:
  //static const URL = '10.0.2.2:8888';

  dynamic getMeals() async {
     // final response = await http.get(URL + '/default/mealResource?TableName=meals');
     final response = await http.get(new Uri.http(URL, 'meals'));
     print(response.body);

     return json.decode(response.body);
  }

  // TODO Michal: make this used
  String getImageUrl(String id) {
    return "https://assets.stewgo.com.au/meals/${id}.jpg";
  }

// {"Items":[{"Seller":"Papa Johns","Description":"Yummy pizza","ID":2,"Name":"Pizza"},{"Seller":"John Smith","Description":"Spaghetti with mince in a tomato sauce.","ID":1,"Name":"Spaghetti Bolognese"}],"Count":2,"ScannedCount":2}

  /*
  Future<dynamic> getMeals() {
    return Future<dynamic>.delayed(Duration(seconds: 5), () {
      return [
        {"merchant":"Papa Johns","description":"Yummy pizza","id":2,"name":"Pizza"},
        {"merchant":"John Smith","description":"Spaghetti with mince in a tomato sauce.","id":1,"name":"Spaghetti Bolognese"}
        ];
    });
  }
  */
}
