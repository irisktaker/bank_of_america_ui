import 'dart:ui';

import 'package:bank_of_america_ui/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Dashboard".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/icons/menu.png",
            ),
          ),
        ],
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 240,
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.09,
                          child: Container(
                            width: size.width - 32,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(height: 75),
                                Text(
                                  "Hello John Doe!",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.3,
                                  ),
                                ),
                                Text(
                                  "Last login: 10:33 AM, 08.02.2022",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xFFFFFFFF).withOpacity(0.4),
                            radius: 65,
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                              radius: 55,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width - 32,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xFF083C6F).withOpacity(0.65),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Bank Accounts",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4DBEE0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "2 Active Accounts",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Divider(
                            color: Color(0xFF4DBEE0),
                          ),
                        ),
                        const Text(
                          "Accounting Balance",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4DBEE0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/location_dot.png",
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "\$ 6,328.33",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
