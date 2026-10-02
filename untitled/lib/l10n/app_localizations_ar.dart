// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get error => 'خطا';

  @override
  String get emailOrPasswordIsIncorrect =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get ok => 'حسنا';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signUp => 'انشاء حساب';

  @override
  String get name => 'الاسم';
}
