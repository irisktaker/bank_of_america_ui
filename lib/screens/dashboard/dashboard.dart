import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '../drawer/drawer.dart';
import '../messages/messages_screen.dart';
import '/widgets/background/background_widget.dart';
import 'bank_account_section.dart';
import 'messages_section.dart';
import 'name_profile_section.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: Container(),
        title: "Dashboard",
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
            child: Row(
              children: [
                tapped ? DrawerScreen(size: size) : Container(),
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              NameProfileSection(size: size),
                              BankAccountSection(size: size),
                              const SizedBox(height: 16),
                              SizedBox(
                                  height: size.height * 0.32,
                                  child: MessagesSection(size: size)),
                              btnViewMore(context),
                              const SizedBox(height: 10),
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

  Container btnViewMore(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF083C6F).withOpacity(0.70),
            const Color(0xFF4DBEE0).withOpacity(0.70),
            const Color(0xFF4DBEE0).withOpacity(0.70),
          ],
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MessagesScreen(),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        textColor: Colors.white,
        child: const Text(
          "View More",
        ),
      ),
    );
  }
}
