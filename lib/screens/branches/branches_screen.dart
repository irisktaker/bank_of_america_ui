import 'dart:ui';

import 'package:flutter/material.dart';

import '/screens/drawer/drawer.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import '/widgets/button/custom_main_btn.dart';
import '/widgets/background/background_widget.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        title: "Branch",
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
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.06,
                                right: size.width * 0.10,
                                child: Image.asset(
                                  "assets/images/location_dot.png",
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.30,
                                left: size.width * 0.30,
                                child: Image.asset(
                                  "assets/icons/location.png",
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.40,
                                right: size.width * 0.50,
                                child: Image.asset(
                                  "assets/images/location_dot.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      branchBoxWidget(
                        size,
                        marketImage: "assets/images/market.png",
                        text: "Quartermaster Plaza",
                        openTime: "8:00 AM - 04:30 PM ",
                        isOpen: true,
                        location: "2330 W Oregon Ave",
                        distance: "3.2 km",
                      ),
                      branchBoxWidget(
                        size,
                        marketImage: "assets/images/market.png",
                        text: "10th and Chestnut",
                        openTime: "9:00 AM - 05:00 PM ",
                        isOpen: true,
                        location: "932 Chestnut St",
                        distance: "6.4 km",
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

  Container branchBoxWidget(
    Size size, {
    required String marketImage,
    required String text,
    required String openTime,
    required bool isOpen,
    required String location,
    required String distance,
  }) {
    return Container(
      width: size.width,
      height: size.height * 0.18,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            marketImage,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      openTime,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      isOpen == true ? "(Open Now)" : "(Closed Now)",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          distance,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomMainBtn(
                        onTap: () {},
                        height: 38,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Get Direction",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.place_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
