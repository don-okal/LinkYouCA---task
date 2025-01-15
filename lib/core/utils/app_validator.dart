class AppValidator {
  static String? name(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'الاسم لا يمكن أن يكون فارغًا';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'يجب أن يكون الاسم بين 3 و 20 حرفًا';
    }
    return null;
  }

  static String? birthDate(String? birthDate) {
    if (birthDate == null || birthDate.isEmpty) {
      return 'تاريخ الميلاد مطلوب';
    }
    return null;
  }

  static String? startDate(String? startDate) {
    if (startDate == null || startDate.isEmpty) {
      return 'تاريخ البدء مطلوب';
    }
    return null;
  }

  static String? endDate(String? endDate) {
    if (endDate == null || endDate.isEmpty) {
      return 'تاريخ النهاية مطلوب';
    }
    return null;
  }

  static String? id(String? id) {
    if (id == null || id.isEmpty) {
      return 'رقم الهوية مطلوب';
    }
    return null;
  }

  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رابط';
    }
    final RegExp urlPattern = RegExp(
      r'^(https?|ftp)://[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );
    if (!urlPattern.hasMatch(value)) {
      return 'يرجى إدخال رابط صحيح';
    }
    return null;
  }

  static String? addExercises(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال عدد صحيح';
    }
    if (value.length > 2 || value == '0' || value == '00') {
      return 'يرجى إدخال عدد صحيح';
    }
    return null;
  }

  static String? password(String? value) {
    final specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final upperCaseRegex = RegExp(r'[A-Z]');
    final lowerCaseRegex = RegExp(r'[a-z]');
    final digitRegex = RegExp(r'\d');

    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور على الأقل 8 أحرف';
    }
    if (!upperCaseRegex.hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير';
    }
    if (!lowerCaseRegex.hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير';
    }
    if (!digitRegex.hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رقم';
    }
    if (!specialCharacterRegex.hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رمز خاص';
    }

    return null;
  }

  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور على الأقل 8 أحرف';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    if (!(value.startsWith('010') ||
        value.startsWith('011') ||
        value.startsWith('012') ||
        value.startsWith('015'))) {
      return 'يجب أن يبدأ رقم الهاتف بـ 01';
    }
    if (value.length != 11) {
      return 'يجب أن يكون رقم الهاتف مكون من 11 رقمًا';
    }
    return null;
  }
}
