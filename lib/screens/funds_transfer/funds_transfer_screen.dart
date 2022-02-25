import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../drawer/drawer.dart';
import '../dashboard/dashboard.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import '/widgets/background/background_widget.dart';

class FundsTransferScreen extends StatefulWidget {
  const FundsTransferScreen({Key? key}) : super(key: key);

  @override
  State<FundsTransferScreen> createState() => _FundsTransferScreenState();
}

class SandShapePainter extends CustomPaint {
  Path getSandShapePath(double shapeSize, double fromRadius, double toRadius) {
    return Path()
      ..moveTo(shapeSize, shapeSize)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(shapeSize, shapeSize), radius: shapeSize),
          fromRadius,
          toRadius,
          false)
      ..close();
  }

  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double shapeSize = 100;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;

    canvas.drawPath(
        getSandShapePath(shapeSize, 0, radius), getColoredPaint(Colors.red));
    canvas.drawPath(getSandShapePath(shapeSize, radius, radius),
        getColoredPaint(Colors.purple));
    canvas.drawPath(getSandShapePath(shapeSize, radius * 2, radius),
        getColoredPaint(Colors.blue));
    canvas.drawPath(getSandShapePath(shapeSize, radius * 3, radius),
        getColoredPaint(Colors.green));
    canvas.drawPath(getSandShapePath(shapeSize, radius * 4, radius),
        getColoredPaint(Colors.yellow));
    canvas.drawPath(getSandShapePath(shapeSize, radius * 5, radius),
        getColoredPaint(Colors.orange));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class _FundsTransferScreenState extends State<FundsTransferScreen> {
  bool tapped = false;
  bool shadow = false;
  double amount = 15000;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: SandShapePainter(),
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashBoardScreen()))),
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
        title: "funds transfer",
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
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            detailsContainerBox(
                              size,
                              profileImage: "assets/images/profile.png",
                              transfer: "SENDER",
                              fullName: "Johnes Patric Doel",
                              countryFlag: "assets/images/a_flag.png",
                              currency: "USD",
                              widget: customBTN(
                                widget1: Image.asset(
                                  "assets/images/mc_symbol_opt_63_1x.png",
                                  height: 30,
                                ),
                                text: "Credit Card **56",
                                widget2: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: size.height * 0.10,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  size: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width - 32,
                          // height: size.height * 0.20,
                          margin: const EdgeInsets.only(left: 17),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.31,
                                height: size.height * 0.18,
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFF4cbee0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Amount",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "\$ ${amount.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: size.height * 0.18,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 36),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Money Limit",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "\$ ${amount.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Slider(
                                        value: amount,
                                        onChanged: (value) {
                                          setState(() {});
                                          amount = value;
                                        },
                                        min: 0,
                                        max: 50000,
                                        activeColor: const Color(0xFF4DBEE0),
                                        inactiveColor: Colors.grey,
                                        thumbColor: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        detailsContainerBox(
                          size,
                          profileImage: "assets/images/profile2.jpeg",
                          transfer: "RECEPIENT",
                          fullName: "Ana Jane Roe",
                          countryFlag: "assets/images/u_flag.png",
                          currency: "EUR",
                          widget: customBTN(
                            text: "Transfer",
                            color: Colors.orange[800],
                            btnTextColor: Colors.white,
                          ),
                        ),
                        Container(
                          width: size.width - 32,
                          height: size.height * 0.18,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/three-o-clock-clock.png",
                                    width: 16,
                                    height: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Recent Transfers",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              DefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/profile.png"),
                                      radius: 20,
                                    ),
                                    const Text("17 Sep. 22"),
                                    const Text("Maryan Jonans"),
                                    Row(
                                      children: [
                                        const Text("\$ 100.00"),
                                        Image.asset(
                                          "assets/icons/down-arrow.png",
                                          width: 10,
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 26),
                                child: Divider(),
                              ),
                              DefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/profile2.jpeg"),
                                      radius: 20,
                                    ),
                                    const Text("15 Aug. 22"),
                                    const Text("Vanessa Sinky"),
                                    Row(
                                      children: [
                                        const Text("\$ 50.00"),
                                        Image.asset(
                                          "assets/icons/down-arrow.png",
                                          width: 10,
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container detailsContainerBox(
    Size size, {
    required String profileImage,
    required String transfer,
    required String fullName,
    required String countryFlag,
    required String currency,
    required Widget widget,
  }) {
    return Container(
      width: size.width - 32,
      height: size.height * 0.18,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    shadow = !shadow;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(shadow ? 0.6 : 0.4),
                  radius: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      profileImage,
                    ),
                    radius: shadow ? 28 : 30,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transfer,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              customBTN(text: "Manage"),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              customBTN(
                widget1: Image.asset(countryFlag),
                text: currency,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: widget,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container customBTN({
    required String text,
    double? width,
    Widget? widget1,
    Widget? widget2,
    Color? color = Colors.white,
    Color? btnTextColor = Colors.grey,
  }) {
    return Container(
      width: width = 100,
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(2, -1),
            blurRadius: 0.2,
            spreadRadius: 0.2,
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(-1, 2),
            blurRadius: 0.2,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: widget1,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: btnTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            child: widget2,
          ),
        ],
      ),
    );
  }
}









                        // Stack(
                        //   children: [
                        //     Positioned(
                        //       child: Container(
                        //         height: size.height * 0.12,
                        //         color: Colors.transparent,
                        //       ),
                        //     ),
                        //     Positioned(
                        //       left: 40,
                        //       child: Container(
                        //         width: 70,
                        //         height: size.height * 0.12,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     Positioned(
                        //       left: 0,
                        //       child: Container(
                        //         width: 72,
                        //         height: size.height * 0.12,
                        //         decoration: const BoxDecoration(
                        //           borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(40),
                        //             bottomRight: Radius.circular(40),
                        //           ),
                        //           // color: Color(0xFF4DBEE0),
                        //           gradient: LinearGradient(colors: [
                        //             Color.fromARGB(255, 208, 227, 233),
                        //             Color(0xFF34aed5),
                        //           ],
                        //           begin: Alignment.topRight,
                        //           end: Alignment.bottomLeft,
                        //           ),
                        //           // shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       left: 78,
                        //       child: Container(
                        //         width: 80,
                        //         height: size.height * 0.12,
                        //         decoration: const BoxDecoration(
                        //           borderRadius: BorderRadius.only(
                        //             topLeft: Radius.circular(40),
                        //             bottomLeft: Radius.circular(40),
                        //           ),
                        //           color: Colors.red,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
