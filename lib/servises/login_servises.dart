import 'package:shared_preferences/shared_preferences.dart';

class LoginVarification {
  Future<void> saveLogin(bool islogin) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('islogin', islogin);
  }

  Future<bool> readLogin() async {
    final prefs = await SharedPreferences.getInstance();

    final islogin = prefs.getBool('islogin') ?? false;
    return islogin;
  }

  Future<bool> deleteLogin() async{
    final prefs = await SharedPreferences.getInstance();
     final success =  prefs.remove('islogin');
    return success;
  }

}

class customerData {
  Future<void> saveCustomerData(String token, String email) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', token);
    await prefs.setString('email', email);
  }

  // Future<String?> readToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final data = prefs.getString('token') ?? "";
  //   return data;
  // }
  
  Future<String> readEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('email') ?? "";
    return data.toString();
  }
}

class custumerId {
  Future<void> saveId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
  }

  Future<String> readId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id') ?? "";
    
    return id;
  }
  
}
