class AppValidators {
  static String? requiredField(String? value, [String label = 'الحقل']) =>
      value == null || value.trim().isEmpty ? '$label مطلوب' : null;
  static String? email(String? value) => value == null ||
          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)
      ? 'أدخل بريدًا إلكترونيًا صحيحًا'
      : null;
  static String? password(String? value) => value == null || value.length < 8
      ? 'كلمة المرور يجب أن تتكون من 8 أحرف على الأقل'
      : null;
  static String? confirmPassword(String? value, String password) =>
      value != password ? 'كلمتا المرور غير متطابقتين' : null;
}
