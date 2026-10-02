import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('en'));

  changeLocale({required String langCode}) {
    SecureStorageHelper().savePrefString(
      key: ConstantValues.lang,
      value: langCode,
    );
    emit(Locale(langCode));
  }

  getLocale() async {
    String lang = await SecureStorageHelper().getPrefString(
      key: ConstantValues.lang,
      defaultValue: 'en',
    );
    emit(Locale(lang));
  }
}
