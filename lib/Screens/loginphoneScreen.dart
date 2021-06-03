import 'package:flutter/material.dart';
import 'package:medicalemergency/Screens/otpScreen.dart';
import 'package:medicalemergency/Screens/registrationScreen.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({Key key}) : super(key: key);

  @override
  _LoginPhoneScreenState createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                 controller: _controller,
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width:200,
            height: 50,
            child: FlatButton(
              color: Colors.red[900],
                onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => OTPScreen(_controller.text)));
              },

              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                )
            ),
          )
        ],
      ),
    );
  }
}
