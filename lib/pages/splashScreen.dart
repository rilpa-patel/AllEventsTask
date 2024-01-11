import 'package:allevents/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../servises/login_servises.dart';
import './LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginVarification loginVarification = LoginVarification();
  bool islogin = false;

  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async{
     islogin = await loginVarification.readLogin();
     if(islogin){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
     }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF42a5f5),
      body: Center(
        child: Image.asset(
          'assets/images/image.png',
          width: 200.0, 
          height: 200.0, 
        ),
      ),
    );
  }
}


