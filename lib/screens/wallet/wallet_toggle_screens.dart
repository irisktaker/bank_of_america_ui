import 'dart:ui';
import 'package:flutter/material.dart';

import '/widgets/background/background_widget.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import 'credit_card_screen.dart';
import 'saving_screen.dart';

class WalletToggleScreens extends StatefulWidget {
  const WalletToggleScreens({Key? key}) : super(key: key);

  @override
  State<WalletToggleScreens> createState() => _WalletToggleScreensState();
}

class _WalletToggleScreensState extends State<WalletToggleScreens> {
  int screenIndex = 0;

  void selectedScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  late List<Map<String, dynamic>> walletToggleScreens;

  @override
  void initState() {
    walletToggleScreens = [
      {
        'screen': CreditCardScreen(),
        'title': "credit card",
      },
      {
        'screen': SavingScreen(),
        'title': "saving",
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pop(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:const [
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
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemExtent: 160,
                        itemCount: walletToggleScreens.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                selectedScreen(index);
                              },
                              child: Text(
                                walletToggleScreens[index]['title']
                                    .toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            screenIndex == index
                                ? Container(
                                    width: 55,
                                    height: 3,
                                    color: Colors.white,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      child: walletToggleScreens[screenIndex]['screen'],
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
