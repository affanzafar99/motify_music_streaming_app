import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/sigin_screen.dart';
import 'SignUp/register_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'asset/images/AppIcon.png',
                        height: 400,
                        width: 400,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
