import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AppConstants {
  AppConstants._();

  /// - Regex
  static final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
  static final RegExp uppercaseRegex = RegExp(r'[A-Z]');
  static final RegExp lowercaseRegex = RegExp(r'[a-z]');
  static final RegExp digitRegex = RegExp(r'[0-9]');
  static final RegExp specialCharRegex = RegExp(r'[#?!@$%^&*-]');
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
  );
  static final RegExp fullNameRegex = RegExp(
    r"^[A-Za-z][A-Za-z\s'-]{1,48}[A-Za-z]$",
  );

  /// - Images
  static const imgEmptyState = "assets/images/ic_empty_state.png";

  /// - Strings
  static const strEmpty = "";
  static const strHome = "Home";
  static const strPrivacyPolicy = "Privacy Policy";
  static const strTermsAndConditions = "Terms & Conditions";
  static const strDefaultTitle = "Title";
  static const strDefaultSubtitle = "Subtitle";
  static const strCategories = "Categories";
  static const strSeeAll = "See All";
  static const strLogout = "Logout";
  static const strLogin = "Login";
  static const strYes = "Yes";
  static const strNo = "No";
  static const strLogoutWarning = "Are you sure you want to logout ?";
  static const strClearAll = "Clear All";
  static const strSkip = "Skip";
  static const strContinue = "Continue";
  static const strNext = "Next";
  static const strMobileNo = "Mobile No.";
  static const strPassword = "Password";
  static const strSignUp = "Sign Up";
  static const strEmptyPhoneNoError = "Phone number cannot be empty";
  static const strInvalidPhoneNoError = "Enter valid phone number";
  static const strEmptyPasswordError = "Password cannot be empty";
  static const strInvalidPasswordError = "Enter valid password";
  static const strForgotPassword = "Forgot Password ?";
  static const strSignIn = "Sign In";
  static const strDontHaveAccount = "Don't have an account";
  static const strAgreeingToTos = "By Continuing, You Agree To Our";
  static const strPasswordMustBeDiff =
      "Your new password must be different from previous used password";
  static const strNewPassword = "New Password";
  static const strConfirmPassword = "Confirm Password";
  static const strPasswordsDoNotMatch = "Passwords do not match";
  static const strSuccess = "Success!";
  static const strInvalidOtp = "Invalid OTP";
  static const strPasswordSuccess =
      "Your password has been successfully changed";
  static const strFullName = "Full Name";
  static const strEmptyNameError = "Name cannot be empty";
  static const strInvalidNameError = "Enter valid name";
  static const strAccept = "Accept";
  static const strAlreadyHaveAnAccount = "Already have an account ?";
  static const strEmptyContents = "Empty Contents";
  static const strIsDarkMode = "isDarkMode";
  static const strInvalidData = "Invalid Data";
  static const strTooLarge = "Too Large";
  static const strSelectAll = "Select All";
  static const strIsFirstLaunch = "isFirstLaunch";
  static const strLight = "Light";
  static const strDark = "Dark";
  static const strCancel = "Cancel";
  static const strOk = "Ok";
  static const strEmptyData = "Empty Data";

  /// - Functions
  void showLog(String logMessage) {
    if (kDebugMode) {
      debugPrint("LOG: $logMessage");
    }
  }
  
  static String getFormattedDateTime(String? jsonDateTime) {
    int? intJsonDateTime = int.tryParse(jsonDateTime ?? "0");
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      intJsonDateTime ?? 0,
    );

    return DateFormat("MMM dd, yyyy - hh:mm a").format(dateTime);
  }

  static String getFormattedTime(String? jsonDateTime) {
    int? intJsonDateTime = int.tryParse(jsonDateTime ?? "0");
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      intJsonDateTime ?? 0,
    );

    return DateFormat("hh:mm a").format(dateTime);
  }

  static String getDayMonthYear(DateTime dateTime) {
    return DateFormat("dd MMM yyyy").format(dateTime);
  }

  static String getMonth(int monthNum) {
    return DateFormat("MMMM").format(DateTime(DateTime.now().year, monthNum));
  }

  static String getMonthYear (DateTime dateTime) {
    return DateFormat("MMMM yyyy").format(dateTime);
  }

  /// - Validation Logic
  /// Only form fields validation which can be used throughout the application
  
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return strEmptyPhoneNoError; // Text field cannot be empty
    }
    if (!phoneRegex.hasMatch(value)) {
      return AppConstants
          .strInvalidPhoneNoError; // It has to follow the phone no regex
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return strEmptyPasswordError; // Text field cannot be empty
    }
    if (!passwordRegex.hasMatch(value)) {
      return AppConstants
          .strInvalidPasswordError; // It has to follow the password regex
    }
    return null;
  }

  String? validatePasswordInDetail (String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return strEmptyPasswordError; // Text field cannot be empty
    }
    if (value.length < 8 || value.length > 16) {
      return "Password length must be between 8 and 16 characters";
    }
    if (!uppercaseRegex.hasMatch(value)) {
      return "Password must have at least one uppercase letter";
    }
    if (!lowercaseRegex.hasMatch(value)) {
      return "Password must have at least one lowercase letter";
    }
    if (!digitRegex.hasMatch(value)) {
      return "Password must have at least one digit";
    }
    if (!specialCharRegex.hasMatch(value)) {
      return "Password must have at least one special case character";
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return strEmptyNameError; // Text field cannot be empty
    }
    if (!fullNameRegex.hasMatch(value)) {
      return AppConstants
          .strInvalidNameError; // It has to follow the name regex
    }
    return null;
  }
}