import '../helpers/shared_pref_helper.dart';

class AuthenticationService {
  final SharedPrefHelper _sharedPrefHelper = SharedPrefHelper();

  Future<String?> getToken() async {
    return await _sharedPrefHelper.getString('auth_token');
  }

  Future<void> saveToken(String token) async {
    await _sharedPrefHelper.saveString('auth_token', token);
  }

  Future<void> clearToken() async {
    await _sharedPrefHelper.remove('auth_token');
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
