// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "register": "إنشاء حساب",
  "email": "البريد الإلكتروني",
  "password": "كلمة المرور",
  "confirm_password": "تأكيد كلمة المرور",
  "register_now": "تسجيل الآن",
  "already_have_an_account": "لديك حساب؟",
  "dont_have_an_account": "ليس لديك حساب؟",
  "login": "تسجيل الدخول",
  "register_success": "تم إنشاء الحساب بنجاح",
  "register_error": "فشل التسجيل، يرجى المحاولة مرة أخرى",
  "email_error_message": "البريد الإلكتروني مطلوب",
  "password_error_message": "كلمة المرور مطلوبة",
  "passwords_do_not_match_error_message": "كلمات المرور غير متطابقة",
  "login_success": "تم تسجيل الدخول بنجاح",
  "login_error": "فشل تسجيل الدخول، يرجى المحاولة مرة أخرى",
  "forgot_password": "نسيت كلمة المرور؟",
  "reset_password": "إعادة تعيين كلمة المرور",
  "reset_password_email_sent": "تم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني",
  "reset_password_error": "فشل إرسال رابط إعادة التعيين، يرجى المحاولة مرة أخرى",
  "back_to_login": "العودة إلى تسجيل الدخول",
  "invalid_email": "البريد الإلكتروني غير صالح",
  "user_not_found": "المستخدم غير موجود",
  "wrong_password": "كلمة المرور غير صحيحة",
  "email_already_in_use": "هذا البريد مستخدم سابقًا",
  "network_request_failed": "فشل في الاتصال، تحقق من الإنترنت",
  "firebase_generic_error": "حدث خطأ ما، حاول مرة أخرى",
  "home": "الرئيسية",
  "mosques": "المساجد",
  "students": "الطلاب",
  "teachers": "المعلمين",
  "logout": "تسجيل الخروج",
  "yes": "نعم",
  "no": "لا",
  "logout_confirmation": "هل تريد تسجيل الخروج؟",
  "add_mosque": "إضافة مسجد",
  "name": "الاسم",
  "build_date_hijri": "تاريخ البناء (هجري)",
  "build_date_gregorian": "تاريخ البناء (ميلادي)",
  "location": "الموقع",
  "notes": "ملاحظات",
  "required": "مطلوب",
  "save": "حفظ",
  "save_error": "فشل الحفظ، يرجى المحاولة مرة أخرى",
  "mosque_added_success": "تمت إضافة المسجد بنجاح",
  "search": "بحث",
  "edit_mosque": "تعديل المسجد"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar};
}
