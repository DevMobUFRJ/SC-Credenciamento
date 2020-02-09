import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return  _introScreen();
      
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffffffff),
            Color(0xffffffff)
          ],
        ),
        navigateAfterSeconds: MyHomePage(title: 'Semana da Computação'),
        loaderColor: Colors.transparent,
      /*  image: new Image.asset('images/Logo_DevMob.png'),
         photoSize: 100.0,*/
      ),
      Center(
       child: Container(
          margin: const EdgeInsets.all(10.0),
          constraints: BoxConstraints.tightForFinite(
            width: 300,
            height: 300
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Logo_DevMob.png"),
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
        ),
      )
    ],
  );
}