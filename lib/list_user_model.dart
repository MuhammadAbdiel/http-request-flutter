import 'dart:convert';
import 'package:http/http.dart' as http;

class ListUserModel {
  int id;
  String name;

  ListUserModel({
    required this.id,
    required this.name,
  });

  factory ListUserModel.createListUser(Map<String, dynamic> obj) {
    return (ListUserModel(
      id: obj['id'],
      name: obj['first_name'] + ' ' + obj['last_name'],
    ));
  }

  static Future<List<ListUserModel>> getUsers(int page) async {
    String apiUrl = "https://reqres.in/api/users?page=" + page.toString();
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> userData = (jsonObject as Map<String, dynamic>)['data'];

    List<ListUserModel> users = [];
    for (var data in userData) {
      users.add(ListUserModel.createListUser(data));
    }
    return users;
  }
}
