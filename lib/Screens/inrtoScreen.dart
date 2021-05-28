import 'package:flutter/material.dart';
import 'package:medicalemergency/DriverApp/Screens/loginScreen.dart';
import 'package:medicalemergency/Screens/loginScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65.0,
              ),
              Image(
                image: AssetImage(
                  "images/amblogo.png",
                ),
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              // Text(
              //   'SignIn as Patient',
              //   style: TextStyle(fontSize: 25.0, fontFamily: "Brand-Bold"),
              // ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                color: Colors.red[900],
                textColor: Colors.white,
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Sign In as User",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Brand-Bold",
                      ),
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginDriverScreen(),
                    ),
                  );
                },
                color: Colors.green[900],
                textColor: Colors.white,
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Sign In as Driver",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Brand-Bold",
                      ),
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
