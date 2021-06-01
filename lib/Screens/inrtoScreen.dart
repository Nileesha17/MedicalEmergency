import 'package:flutter/material.dart';
import 'package:medicalemergency/DriverApp/Screens/loginScreen.dart';
import 'package:medicalemergency/Screens/loginScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
              ),

              Image(
                image: AssetImage(
                  "images/ambulance.png",
                ),
                width: 250.0,
                height: 250.0,
                alignment: Alignment.center,

              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Welcome to App!",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Brand-Bold",
                    shadows: [
                      Shadow(color: Colors.black12, offset: Offset(2,1), blurRadius:10)
                    ]
                ),
              ),
              // Text(
              //   'SignIn as Patient',
              //   style: TextStyle(fontSize: 25.0, fontFamily: "Brand-Bold"),
              // ),
              SizedBox(height: 30),
              new Container(
                child: new Column(


                  children: <Widget>[

                    new RaisedButton(
                      color: Colors.white,
                      textColor: Colors.red[900],
                      padding: EdgeInsets.all(12),

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Sign In as User",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Brand-Bold",
                                    fontWeight: FontWeight.bold),
                              ))

                        ],

                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 15),
                    new RaisedButton(
                      color: Colors.white,
                      textColor: Colors.green[900],
                      padding: EdgeInsets.all(12),

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: new Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Sign In as Driver",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Brand-Bold",
                                     fontWeight: FontWeight.bold),
                              ))

                        ],

                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginDriverScreen(),
                          ),
                        );
                      },
                    ),


                  ],
                ),
              ),

              SizedBox(
                height: 40.0,
              ),
  ]
          ),
        ),
      ),
    );
    ;
  }
}
