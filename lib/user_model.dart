import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel {
  int id;
  String name;

  UserModel({
    required this.id,
    required this.name,
  });

  factory UserModel.createUser(Map<String, dynamic> obj) {
    return (UserModel(
      id: obj['id'],
      name: obj['first_name'] + ' ' + obj['last_name'],
    ));
  }

  static Future<UserModel> connectToApi(int id) async {
    String apiUrl = "https://reqres.in/api/users/" + id.toString();
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return UserModel.createUser(userData);
  }
}
