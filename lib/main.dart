import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medicalemergency/DataHandler/appData.dart';
import 'package:medicalemergency/Screens/inrtoScreen.dart';
import 'package:medicalemergency/configMap.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentFirrebaseuser = FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

DatabaseReference driverRef =
    FirebaseDatabase.instance.reference().child("drivers");

DatabaseReference riderRequestRef = FirebaseDatabase.instance
    .reference()
    .child("drivers")
    .child(currentFirrebaseuser.uid)
    .child("newRide");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Medical Emergency',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: IntroScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
