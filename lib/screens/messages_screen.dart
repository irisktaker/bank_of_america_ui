import 'dart:ui';

import 'package:bank_of_america_ui/screens/dashboard/messages_section.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/background/background_widget.dart';
import 'dashboard/dashboard.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

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
        title: "wallet",
        onTap: () {},
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                height: size.height,
                child: MessagesSection(size: size),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
