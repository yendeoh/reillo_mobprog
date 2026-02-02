import 'package:flutter/foundation.dart';

/// Simple in-memory session helper. Holds the currently logged in username/email.
class UserSession {
  // ValueNotifier so UI can react when username changes.
  static final ValueNotifier<String?> username = ValueNotifier<String?>(null);

  static void setUsername(String? value) => username.value = value;
  static String? getUsername() => username.value;
}
