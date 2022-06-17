import 'dart:convert';
import 'package:flutter_uicreation/model/user.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url =
      'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        print(list);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
