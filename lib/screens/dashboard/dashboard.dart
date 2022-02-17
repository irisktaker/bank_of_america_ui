import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '/widgets/background/background_widget.dart';
import 'bank_account_section.dart';
import 'messages_section.dart';
import 'name_profile_section.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // drawer: const ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(40.0),
      //   ),
      //   child: Drawer(),
      // ),
      appBar: customAppBar(title: "Dashboard"),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NameProfileSection(size: size),
                  BankAccountSection(size: size),
                  const SizedBox(height: 16),
                  MessagesSection(size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



