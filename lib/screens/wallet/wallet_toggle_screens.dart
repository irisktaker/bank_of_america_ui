import 'dart:ui';
import 'package:bank_of_america_ui/screens/wallet/wallet_bloc.dart';
import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';
import '../drawer/drawer.dart';
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
  final WalletBloc _bloc = WalletBloc();
  
  void selectedScreen(int index) {
    setState(() {
      _bloc.screenIndex = index;
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoardScreen()))),
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
        onTap: () {
          setState(() {
            _bloc.tapped = !_bloc.tapped;
          });
        },
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: SizedBox(
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                _bloc.tapped ?  DrawerScreen(size: size) : Container(),
                  SizedBox(
                    width: size.width,
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
                                    _bloc.screenIndex == index
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
                              child: walletToggleScreens[_bloc.screenIndex]['screen'],
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
      ),
    );
  }
}
