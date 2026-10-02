import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utl/constant_values.dart';

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
}
