import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage;

  SecureStorageHelper.internal()
    : _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  static final SecureStorageHelper instance = SecureStorageHelper.internal();

  factory SecureStorageHelper() {
    return instance;
  }

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<void> _safeWrite({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (_) {
      // Ignore storage failures during browser/local demo usage.
    }
  }

  Future<String> _safeRead({
    required String key,
    required String defaultValue,
  }) async {
    try {
      return (await _storage.read(key: key)) ?? defaultValue;
    } catch (_) {
      return defaultValue;
    }
  }

  // Remove shop from storage
  Future<void> remove({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (_) {
      // Ignore storage failures during browser/local demo usage.
    }
  }

  // Save methods for different data types
  Future<void> savePrefString({
    required String key,
    required String value,
  }) async {
    await _safeWrite(key: key, value: value);
  }

  Future<void> savePrefInt({required String key, required int value}) async {
    await _safeWrite(key: key, value: value.toString());
  }

  Future<void> savePrefBool({required String key, required bool value}) async {
    await _safeWrite(key: key, value: value.toString());
  }

  Future<void> savePrefDouble({
    required String key,
    required double value,
  }) async {
    await _safeWrite(key: key, value: value.toString());
  }

  Future<void> savePrefStringList({
    required String key,
    required List<String> value,
  }) async {
    await _safeWrite(key: key, value: value.join(','));
  }

  // Get methods for different data types
  Future<String> getPrefString({
    required String key,
    required String defaultValue,
  }) async {
    return _safeRead(key: key, defaultValue: defaultValue);
  }

  Future<int> getPrefInt({
    required String key,
    required int defaultValue,
  }) async {
    final value = await _safeRead(key: key, defaultValue: '');
    return value.isNotEmpty ? int.parse(value) : defaultValue;
  }

  Future<bool> getPrefBool({
    required String key,
    required bool defaultValue,
  }) async {
    final value = await _safeRead(key: key, defaultValue: '');
    return value.isNotEmpty ? value.toLowerCase() == 'true' : defaultValue;
  }

  Future<double> getPrefDouble({
    required String key,
    required double defaultValue,
  }) async {
    final value = await _safeRead(key: key, defaultValue: '');
    return value.isNotEmpty ? double.parse(value) : defaultValue;
  }

  Future<List<String>> getPrefStringList({
    required String key,
    required List<String> defaultValue,
  }) async {
    final value = await _safeRead(key: key, defaultValue: '');
    return value.isNotEmpty ? value.split(',') : defaultValue;
  }
}
