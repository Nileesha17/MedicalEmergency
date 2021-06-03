import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);


  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
        backgroundColor: Colors.red[900],),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +91-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),


                 child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
            eachFieldWidth: 40.0,
            eachFieldHeight: 55.0,
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration: pinPutDecoration,
            selectedFieldDecoration: pinPutDecoration,
            followingFieldDecoration: pinPutDecoration,
            pinAnimationType: PinAnimationType.fade,
            // onSubmit: (pin) async {
            // try {
            // await FirebaseAuth.instance
            //     .signInWithCredential(PhoneAuthProvider.credential(
            // verificationId: _verificationCode, smsCode: pin))
            //     .then((value) async {
            // if (value.user != null) {
            // Navigator.pushAndRemoveUntil(
            // context,
            // MaterialPageRoute(builder: (context) => Home()),
            // (route) => false);
            // }
            // });
            // } catch (e) {
            // FocusScope.of(context).unfocus();
            //  _scaffoldkey.currentState
            //
            //    }
            //.showSnackBar(SnackBar(content: Text('invalid OTP')));
            // }

          ),
          )
        ],
      ),
    );
  }
}
