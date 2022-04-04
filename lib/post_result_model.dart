import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResultModel {
  String id;
  String name;
  String job;
  String created;

  PostResultModel({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory PostResultModel.createPostResult(Map<String, dynamic> object) {
    return PostResultModel(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResultModel> connectToApi(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      "name": name,
      "job": job,
    });

    var jsonObject = json.decode(apiResult.body);
    return PostResultModel.createPostResult(jsonObject);
  }
}
