import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '../drawer/drawer.dart';
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
      appBar: customAppBar(
        leading: Container(),
        title: "Dashboard",
        onTap: () {
        },
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Row(
              children: [
                DrawerScreen(size: size),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}