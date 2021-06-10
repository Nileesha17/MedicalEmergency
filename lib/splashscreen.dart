
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalemergency/Screens/inrtoScreen.dart';
import 'package:medicalemergency/menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds:10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
    });
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: Container(alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300, width:300,
                  child: Lottie.asset(
                    'assets/1631-healthtap-spinner.json',
                    repeat: true,
                    reverse: true,
                    animate: true,
                  ),)
              ],

            )
        )

    );
    // TODO: implement build
    throw UnimplementedError();
  }
  }
