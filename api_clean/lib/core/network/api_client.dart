import 'dart:convert';

import 'package:api_clean/core/utl/constant_values.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<List<T>> getDataList<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse('${ConstantValues.baseUrl}$endpoint'),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      List<T> data = [];

      for (var item in jsonBody) {
        data.add(fromJsonT!(item));
      }
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<T> postData<T>({
    required String endpoint,
    Map<String, dynamic>? body,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.post(
      Uri.parse('${ConstantValues.baseUrl}$endpoint'),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );
    if (response.statusCode == 201) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<T> putData<T>({
    required String endpoint,
    Map<String, dynamic>? body,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.put(
      Uri.parse('${ConstantValues.baseUrl}$endpoint'),
      body: jsonEncode(body),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<bool> deleteData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.delete(
      Uri.parse('${ConstantValues.baseUrl}$endpoint'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<T> postMultiPartData<T>({
    required Map<String, String> fields,
    required String endpoint,
    required List<http.MultipartFile> files,
    required T Function(dynamic data) fromJsonT,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse(endpoint));

    for (var field in fields.entries) {
      var key = field.key;
      var value = field.value;
      request.fields[key] = value;
    }

    for (http.MultipartFile file in files) {
      request.files.add(file);
    }

    final response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT(jsonBody);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
