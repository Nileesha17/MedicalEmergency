import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicalemergency/Screens/loginphoneScreen.dart';
import 'package:medicalemergency/Screens/mainScreen.dart';
import 'package:medicalemergency/Screens/registrationScreen.dart';
import 'package:medicalemergency/Widgets/progressDialog.dart';
import 'package:medicalemergency/main.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Emergency'),
        backgroundColor: Colors.red[900],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65.0,
              ),
              Image(
                image: AssetImage(
                  "images/man.png",
                ),
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'SignIn as Patient',
                style: TextStyle(fontSize: 25.0, fontFamily: "Brand-Bold"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                            color: Colors.red[900]
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage("Invalid Email", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage("Password invalid", context);
                        } else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                      color: Colors.red[900],
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Brand-Bold",
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                    ),

                 SizedBox(height: 20,),
                 RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPhoneScreen(),
                      ),
                    );

        },
          color: Colors.green[900],
          textColor: Colors.white,
          child: Container(
            height: 50.0,
            child: Center(
              child: Text(
                "Log In through Phone",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Brand-Bold",
                ),
              ),
            ),
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(24.0),
          )
                 )  ],
                ),
              ),


              FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[


                        Align(
                            child: Text(
                              "Dont have an account?",
                              style:
                              TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                        ),


                        Align(
                            child: Text(
                              " SignUp",
                              style:
                              TextStyle(fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                              color: Colors.red[900],
                                decoration: TextDecoration.underline,)
                              ,
                            )
                        ),


                      ],
                    ),
                  ),

              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating, Please wait..",
          );
        });

    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
          displayToastMessage("Login Successful", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("Record not found, Create an account", context);
        }
      });
    } else {
      //Display error message
      Navigator.pop(context);
      displayToastMessage("Error", context);
    }
  }
}
