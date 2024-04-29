import 'dart:async';
import 'dart:developer';

more40() {
  return (value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().split('').length < 3 ||
        value.trim().split('').length > 40) {
              log(value,time: DateTime.now(),name: 'more 40',zone: Zone.root);
              log(value.trim().split('').length.toString());
      return 'نام آگهی باید بیشتر از 2 کلمه و کمتر از 40 کلمه باشد';
    }
    return null;
  };
}

getInt() {
  return (value) {
    if (value == null ||
        value.isEmpty ||
        int.tryParse(value.replaceAll(',', '')) == null) {
      return 'لطفاً یک عدد معتبر وارد کنید';
    }
    return null;
  };
}

NotNullable() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'لطفا این فیلد هارا خالی رها نکنید';
    }
    return null;
  };
}

IranPhoneNumberValidator() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'لطفا شماره خود را وارد کنید.';
    }
RegExp phoneRegExp = RegExp(r'^(\+|0098|0)?9[0-9]{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'لطفا شماره موبایل خود را درست وارد کنید';
    }
  };
}

EmailValidator() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'لطفا ایمیل خود را وارد کنید.';
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'ایمیل وارد شده معتبر نیست.';
    }

    if (!value.contains('@gmail.com')) {
      return 'ایمیل باید یک جیمیل باشد.';
    }

    return null;
  };
}

PasswordValidator() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'لطفا رمز عبور خود را وارد کنید.';
    }

    if (value.length < 8) {
      return 'رمز عبور باید حداقل 8 حرف باشد.';
    }

    final RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    );

    if (!passwordRegExp.hasMatch(value)) {
      return 'رمز عبور باید شامل حروف بزرگ، حروف کوچک و اعداد باشد.';
    }

    return null;
  };
}
