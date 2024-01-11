import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../servises/firebase.dart';
import '../servises/login_servises.dart';
import '../pages/HomeScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {
  late Color _startColor;
  late Color _endColor;
  late Color _currentColor;
  late Timer _timer;

  final AuthService _auth = AuthService();
  LoginVarification loginVarification = LoginVarification();

  @override
  void initState() {
    super.initState();
    _startColor = Colors.blue;
    _endColor = Colors.green;
    _currentColor = _startColor;

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentColor = (_currentColor == _startColor) ? _endColor : _startColor;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_startColor, _endColor],
          ),
        ),
        child:Center(
          child: ElevatedButton(
             style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
            onPressed: () async {
              User? user = await _auth.signInWithGoogle();
              if (user != null) {
                loginVarification.saveLogin(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(),)
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login failed. Please try again.'),
                  ),
                );
              }
            },
            child: Container(
              width: 300,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      child: Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover)),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Sign-in with Google'),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
