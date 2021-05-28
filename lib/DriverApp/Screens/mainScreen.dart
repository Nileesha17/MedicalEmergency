import 'package:flutter/material.dart';
import 'package:medicalemergency/DriverApp/TabPages/historyTabPage.dart';
import 'package:medicalemergency/DriverApp/TabPages/homeTabPage.dart';
import 'package:medicalemergency/DriverApp/TabPages/profileTabPage.dart';
import 'package:medicalemergency/DriverApp/TabPages/ratingTabPage.dart';

class MainDriverScreen extends StatefulWidget {
  const MainDriverScreen({Key key}) : super(key: key);

  @override
  _MainDriverScreenState createState() => _MainDriverScreenState();
}

class _MainDriverScreenState extends State<MainDriverScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          HomeTabPage(),
          HistoryTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Earn"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review_outlined), label: "Rating"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: "Profile"),
        ],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.green[900],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12.0),
        showUnselectedLabels: true,
      ),
    );
  }
}
