import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/widgets/background/background_widget.dart';
import '../../widgets/listtile/custom_listtile.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
          ),
          child: Drawer()),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Drawer(),
          child: Image.asset(
            "assets/icons/menu.png",
          ),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Dashboard".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const Drawer(),
        //         ),
        //       );
        //     },
        //     child: Image.asset(
        //       "assets/icons/menu.png",
        //     ),
        //   ),
        // ],
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
                    height: size.height * 0.27,
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.08,
                          child: Container(
                            width: size.width - 32,
                            height: size.height * 0.17,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 70),
                                const Text(
                                  "Hello John Doe!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.3,
                                  ),
                                ),
                                Text(
                                  "Last login: " +
                                      DateFormat("yyyy-MM-dd hh:mm")
                                          .format(DateTime.now()),
                                  style: const TextStyle(
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
                    height: size.height * 0.18,
                    padding: const EdgeInsets.symmetric(vertical: 6),
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
                            fontSize: 15,
                            color: Color(0xFF4DBEE0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "2 Active Accounts",
                          style: TextStyle(
                            fontSize: 15,
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
                            fontSize: 15,
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
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: size.width - 32,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      Icon(
                                        Icons.email_outlined,
                                        color: Colors.grey,
                                        size: 22,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 6,
                                          child: Text(
                                            "3",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  "Messages",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              title: "Remote Access Scam",
                              subtitle:
                                  "The banking industry has seen an increase in customers and business receiving cold calls from ...",
                              widget: const Icon(
                                Icons.lock_open_outlined,
                                color: Colors.white70,
                                size: 19,
                              ),
                            ),
                            const Divider(),
                            CustomListTile(
                              title: "Where can i find my IBAN?",
                              subtitle:
                                  "The banking industry has seen an increase in customers and business receiving cold calls from ...",
                              widget: Image.asset(
                                "assets/icons/headphones_icon.png",
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
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
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                textColor: Colors.white,
                                child: const Text(
                                  "View More",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
