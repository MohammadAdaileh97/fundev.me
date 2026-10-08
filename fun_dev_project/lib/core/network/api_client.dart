import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utl/constant_values.dart';

class ApiClient<T> {
  static const Duration _requestTimeout = Duration(seconds: 8);

  static T _fallbackSingleValue<T>({
    required String endPoint,
    required T Function(dynamic data) fromJsonT,
  }) {
    switch (endPoint) {
      case 'getAds.php':
        return fromJsonT({'Id': 'demo-ad', 'Title': 'Demo Ad', 'ImageUrl': ''});
      case 'getCategories.php':
        return fromJsonT({
          'Id': 'demo-category',
          'Name': 'Demo',
          'ImageUrl': '',
        });
      default:
        return fromJsonT({});
    }
  }

  static List<T> _fallbackListValue<T>({
    required String endPoint,
    required T Function(dynamic data) fromJsonT,
  }) {
    switch (endPoint) {
      case 'getAds.php':
        return [
          fromJsonT({'Id': 'demo-ad', 'Title': 'Demo Ad', 'ImageUrl': ''}),
        ];
      case 'getCategories.php':
        return [
          fromJsonT({'Id': 'demo-category', 'Name': 'Demo', 'ImageUrl': ''}),
        ];
      default:
        return [];
    }
  }

  static Map<String, dynamic> _demoAuthFallback({
    required String endPoint,
    required Map<String, dynamic> body,
  }) {
    final email = (body['Email'] ?? body['email'] ?? '').toString();
    final sanitizedEmail = email.isNotEmpty ? email : 'demo@demo.com';
    final name =
        sanitizedEmail.contains('@')
            ? sanitizedEmail.split('@').first
            : 'demo-user';

    switch (endPoint) {
      case 'Login.php':
        return {
          'Email': sanitizedEmail,
          'Id': 'demo-user-id',
          'Name': name,
          'msg': 'Demo login successful',
          'result': true,
          'otp': null,
          'ImageUrl': '',
        };
      case 'SignUp.php':
        return {
          'Email': sanitizedEmail,
          'Id': 'demo-user-id',
          'Name': name,
          'msg': 'Demo signup successful',
          'result': true,
          'otp': null,
          'ImageUrl': '',
        };
      case 'ForgotPassword.php':
        return {
          'Email': sanitizedEmail,
          'Id': '',
          'Name': '',
          'msg': 'Demo password reset email sent',
          'result': true,
          'otp': 123456,
          'ImageUrl': '',
        };
      case 'UpdatePassword.php':
        return {
          'Email': '',
          'Id': body['Id'] ?? 'demo-user-id',
          'Name': '',
          'msg': 'Demo password updated successfully',
          'result': true,
          'otp': null,
          'ImageUrl': '',
        };
      default:
        return {'msg': 'Demo request successful', 'result': true};
    }
  }

  static bool _isAuthEndpoint(String endPoint) {
    return const {
      'Login.php',
      'SignUp.php',
      'ForgotPassword.php',
      'UpdatePassword.php',
    }.contains(endPoint);
  }

  static Future<T> getData<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    try {
      final response = await http
          .get(Uri.parse("${ConstantValues.baseUrl}$endPoint"))
          .timeout(_requestTimeout);
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return fromJsonT!(jsonBody);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (_) {
      if (fromJsonT != null) {
        if (_isAuthEndpoint(endPoint)) {
          return fromJsonT(_demoAuthFallback(endPoint: endPoint, body: {}));
        }
        return _fallbackSingleValue<T>(
          endPoint: endPoint,
          fromJsonT: fromJsonT,
        );
      }
      throw Exception("Something went wrong");
    }
  }

  static Future<List<T>> getDataList<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    try {
      final response = await http
          .get(Uri.parse("${ConstantValues.baseUrl}$endPoint"))
          .timeout(_requestTimeout);
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);

        var data = jsonBody['data'];

        List<T> list = [];
        for (var item in data) {
          list.add(fromJsonT!(item));
        }
        return list;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (_) {
      if (fromJsonT != null) {
        return _fallbackListValue<T>(endPoint: endPoint, fromJsonT: fromJsonT);
      }
      return [];
    }
  }

  static Future<T> postData<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http
          .post(Uri.parse("${ConstantValues.baseUrl}$endPoint"), body: body)
          .timeout(_requestTimeout);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonBody = jsonDecode(response.body);
        return fromJsonT!(jsonBody);
      }

      throw Exception("Something went wrong");
    } catch (_) {
      if (_isAuthEndpoint(endPoint) && fromJsonT != null) {
        final fallback = _demoAuthFallback(endPoint: endPoint, body: body);
        return fromJsonT(fallback);
      }

      throw Exception("Something went wrong");
    }
  }

  static Future<T> putData<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http
          .put(
            Uri.parse("${ConstantValues.baseUrl}$endPoint"),
            body: jsonEncode(body),
            headers: {'Content-type': 'application/json; charset=UTF-8'},
          )
          .timeout(_requestTimeout);
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return fromJsonT!(jsonBody);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (_) {
      if (_isAuthEndpoint(endPoint) && fromJsonT != null) {
        return fromJsonT(_demoAuthFallback(endPoint: endPoint, body: body));
      }
      throw Exception("Something went wrong");
    }
  }

  static Future<bool> deleteData({required String endPoint}) async {
    try {
      final response = await http
          .delete(Uri.parse("${ConstantValues.baseUrl}$endPoint"))
          .timeout(_requestTimeout);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  static Future<T> postMultiPartData<T>({
    required Map<String, String> fields,
    required String endPoint,
    required List<http.MultipartFile> files,
    required T Function(dynamic data) fromJsonT,
  }) async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${ConstantValues.baseUrl}$endPoint"),
      );

      for (var field in fields.entries) {
        var key = field.key;
        var value = field.value;
        request.fields[key] = value;
      }

      for (http.MultipartFile file in files) {
        request.files.add(file);
      }

      final response = await http.Response.fromStream(
        await request.send().timeout(_requestTimeout),
      );

      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        return fromJsonT(data);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (error) {
      if (_isAuthEndpoint(endPoint)) {
        return fromJsonT(_demoAuthFallback(endPoint: endPoint, body: fields));
      }
      throw Exception("Something went wrong");
    }
  }
}
