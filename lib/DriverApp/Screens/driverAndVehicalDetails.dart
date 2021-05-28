import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicalemergency/DriverApp/Screens/mainScreen.dart';
import 'package:medicalemergency/configMap.dart';
import 'package:medicalemergency/main.dart';
import 'package:medicalemergency/DriverApp/Screens/registrationScreen.dart';

class DriverAndVehicleInfo extends StatelessWidget {
  TextEditingController drivingLicTextEditingController =
      TextEditingController();
  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController rcTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 22.0,
              ),
              Image.asset(
                "images/vechreg.png",
                height: 250.0,
                width: 390.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Complete the Registration",
                      style: TextStyle(
                        fontSize: 27.0,
                        fontFamily: "Brand-Bold",
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    TextField(
                      controller: drivingLicTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Driving Licence Number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: rcTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Registration Certificate Number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: userIdTextEditingController,
                      decoration: InputDecoration(
                        labelText: "User Identity Number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (drivingLicTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Field should not be empty", context);
                          } else if (rcTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Field should not be empty", context);
                          } else if (userIdTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Field should not be empty", context);
                          } else {
                            saveDriverVehicleInfo(context);
                          }
                        },
                        color: Colors.green[900],
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Done",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                                size: 26.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDriverVehicleInfo(context) {
    String userId = currentFirrebaseuser.uid;

    Map vehicleInfoMap = {
      "lic_number": drivingLicTextEditingController.text,
      "rc_number": rcTextEditingController.text,
      "user_id": userIdTextEditingController.text,
    };

    driverRef.child(userId).child("vehicle_details").set(vehicleInfoMap);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainDriverScreen(),
      ),
    );
    displayToastMessage("Registration Successful", context);
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(
    msg: message,
  );
}
