import 'package:hive/hive.dart';

class SessionManager {
  final Box sessionBox = Hive.box('session');

  void setSession(String token, int id, String firstName, String lastName,
      String email, bool isActive, bool isAdmin) {
    sessionBox.put(AppKey.token, token);
    sessionBox.put(AppKey.id, id);
    sessionBox.put(AppKey.firstName, firstName);
    sessionBox.put(AppKey.lastName, lastName);
    sessionBox.put(AppKey.email, email);
    sessionBox.put(AppKey.isActive, isActive);
    sessionBox.put(AppKey.isAdmin, isAdmin);
  }

  String? getToken() => sessionBox.get(AppKey.token);
  int? getId() => sessionBox.get(AppKey.id);
  String? getFirstName() => sessionBox.get(AppKey.firstName);
  String? getLastName() => sessionBox.get(AppKey.lastName);
  String? getEmail() => sessionBox.get(AppKey.email);
  bool? getIsActive() => sessionBox.get(AppKey.isActive);
  bool? getIsAdmin() => sessionBox.get(AppKey.isAdmin);

  bool isActiveSession() {
    String? activeToken = getToken();
    int? activeId = getId();
    String? activeFirstName = getFirstName();
    String? activeLastName = getLastName();
    String? activeEmail = getEmail();
    bool? activeIsActive = getIsActive();
    bool? activeIsAdmin = getIsAdmin();
    return activeToken != null &&
        activeId != null &&
        activeFirstName != null &&
        activeLastName != null &&
        activeEmail != null &&
        activeIsActive != null &&
        activeIsAdmin != null;
  }

  void signOut() {
    sessionBox.delete(AppKey.token);
    sessionBox.delete(AppKey.id);
    sessionBox.delete(AppKey.firstName);
    sessionBox.delete(AppKey.lastName);
    sessionBox.delete(AppKey.email);
    sessionBox.delete(AppKey.isActive);
    sessionBox.delete(AppKey.isAdmin);
  }
}

class AppKey {
  static const String token = 'TOKEN_KEY';
  static const String id = 'ID_KEY';
  static const String firstName = 'FIRST_NAME_KEY';
  static const String lastName = 'LAST_NAME_KEY';
  static const String email = 'EMAIL_KEY';
  static const String isActive = 'IS_ACTIVE_KEY';
  static const String isAdmin = 'IS_ADMIN_KEY';
}

// final String token;
// final int id;
// final String firstName;
// final String lastName;
// final String username;
// final String email;
// final bool isActive;
// final bool isAdmin;