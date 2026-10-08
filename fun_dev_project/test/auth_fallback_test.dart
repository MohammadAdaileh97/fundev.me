import 'package:flutter_test/flutter_test.dart';
import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/auth/data/model/auth_model.dart';

void main() {
  group('Auth API fallback', () {
    test(
      'returns a demo auth result when the remote PHP endpoint is unavailable',
      () async {
        final result = await ApiClient.postData<AuthModel>(
          endPoint: 'Login.php',
          body: {'Email': 'demo@demo.com', 'Password': '123456'},
          fromJsonT: (data) => AuthModel.fromJson(json: data),
        );

        expect(result.result, isTrue);
        expect(result.email, 'demo@demo.com');
        expect(result.name, 'demo');
      },
    );

    test(
      'supports demo social account login values without the backend',
      () async {
        final googleResult = await ApiClient.postData<AuthModel>(
          endPoint: 'Login.php',
          body: {'Email': 'google-user@demo.com', 'Password': 'social-login'},
          fromJsonT: (data) => AuthModel.fromJson(json: data),
        );

        final facebookResult = await ApiClient.postData<AuthModel>(
          endPoint: 'Login.php',
          body: {'Email': 'facebook-user@demo.com', 'Password': 'social-login'},
          fromJsonT: (data) => AuthModel.fromJson(json: data),
        );

        expect(googleResult.result, isTrue);
        expect(googleResult.email, 'google-user@demo.com');
        expect(googleResult.name, 'google-user');
        expect(facebookResult.result, isTrue);
        expect(facebookResult.email, 'facebook-user@demo.com');
        expect(facebookResult.name, 'facebook-user');
      },
    );
  });
}
