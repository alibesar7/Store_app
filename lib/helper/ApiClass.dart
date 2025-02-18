//
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//
// class Api {
//   Future<dynamic> get({required String url, String? token}) async {
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//     };
//     if (token != null) {
//       headers["Authorization"] = "Bearer $token";
//     }
//
//     http.Response response = await http.get(Uri.parse(url), headers: headers);
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Error: ${response.statusCode}");
//     }
//   }
//
//   Future<dynamic> post({
//     required String url,
//     required dynamic body,
//     String? token,
//   }) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token"
//       });
//     }
//
//     http.Response response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: jsonEncode(body),
//     );
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//           "You have an error in status code ${response.statusCode}: ${response.body}");
//     }
//   }
//
//   Future<dynamic> put({
//     required String url,
//     required dynamic body,
//     String? token,
//   }) async {
//     Map<String, String> headers = {
//       "Content-Type": "application/x-www-form-urlencoded",
//     };
//     if (token != null) {
//       headers.addAll({
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token"
//       });
//     }
//
//     http.Response response = await http.put(
//       Uri.parse(url),
//       headers: headers,
//       body: jsonEncode(body),
//     );
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//           "You have an error in status code ${response.statusCode}: ${response.body}");
//     }
//   }
// }
import 'dart:convert';

class Api {
  Future<dynamic> get({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

  Future<dynamic> post({required String url, required Map<String, dynamic> body}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}