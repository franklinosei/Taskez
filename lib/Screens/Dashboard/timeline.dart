import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskez/Screens/Dashboard/dashboard.dart';
import 'package:taskez/Screens/Dashboard/notifications.dart';
import 'package:taskez/Screens/Dashboard/projects.dart';
import 'package:taskez/Screens/Dashboard/search_screen.dart';
import 'package:taskez/Values/values.dart';
import 'package:taskez/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:taskez/widgets/Dashboard/bottomNavigationItem.dart';

class Timeline extends StatefulWidget {
  Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final List<Widget> dashBoardScreens = [
    Dashboard(),
    ProjectScreen(),
    NotificationScreen(),
    SearchScreen()
  ];
  Widget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#181a1f"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          PageStorage(child: currentScreen, bucket: bucket)
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.only(top: 10, right: 13, left: 13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(icon: Icons.widgets),
                  Spacer(),
                  BottomNavigationItem(icon: FeatherIcons.clipboard),
                  Spacer(),
                  Positioned(
                    top: 40,
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: HexColor.fromHex("246CFD"),
                            shape: BoxShape.circle),
                        child: Icon(Icons.add, color: Colors.white)),
                  ),
                  Spacer(),
                  BottomNavigationItem(icon: FeatherIcons.bell),
                  Spacer(),
                  BottomNavigationItem(icon: FeatherIcons.search)
                ])));
  }
}
