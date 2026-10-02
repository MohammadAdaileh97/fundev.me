import 'dart:convert';

import 'package:bloc_clean/core/utl/constant_values.dart';
import 'package:http/http.dart' as http;

class ApiClient<T> {
  static Future<T> getData<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse("${ConstantValues.baseUrl}$endPoint"),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<List<T>> getDataList<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse("${ConstantValues.baseUrl}$endPoint"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      List<T> list = [];
      for (var item in jsonBody) {
        list.add(fromJsonT!(item));
      }
      return list;
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> postData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.post(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 201) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> putData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.put(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<bool> deleteData({required String endpoint}) async {
    final response = await http.delete(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
