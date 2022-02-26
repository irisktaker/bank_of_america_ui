import 'dart:ui';
import 'package:flutter/material.dart';


import '../drawer/drawer.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import '../dashboard/dashboard.dart';
import '/widgets/background/background_widget.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoardScreen()))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 16),
              Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                "Back",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        title: "Settings",
        onTap: () {
          setState(() {
            tapped = !tapped;
          });
        },
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                tapped ? DrawerScreen(size: size) : Container(),
                const Center(
                  child: Text("Settings Screen"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
