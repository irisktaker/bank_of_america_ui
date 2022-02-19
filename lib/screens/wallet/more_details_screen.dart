import 'dart:ui';

import 'package:flutter/material.dart';

import '../../singleton/singleton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/background/background_widget.dart';
import '../../widgets/history_of_transaction_card/history_of_transaction_card.dart';
import 'credit_card_screen.dart';
import 'saving_screen.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  bool tapped = false;
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pop(context)),
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
                // tapped ? DrawerScreen(size: size) : Container(),
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Expanded(
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
                                        // selectedScreen(index);
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
                        ),
                        Expanded(
                          flex: 10,
                          child: HistoryOfTransactionCard(
                            // widget.index !!!
                            titleLogo: "assets/icons/three-o-clock-clock.png",
                            title: "History of Transactions",
                            child: ListView.builder(
                              itemCount:
                                  Singleton.instance.viewTransactionHistory.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text(Singleton.instance
                                            .viewTransactionHistory[index].date),
                                        const Spacer(),
                                        Text(
                                          Singleton
                                              .instance
                                              .viewTransactionHistory[index]
                                              .brandName,
                                        ),
                                        const Spacer(flex: 2),
                                        Text(Singleton
                                                .instance
                                                .viewTransactionHistory[index]
                                                .currency +
                                            " " +
                                            Singleton
                                                .instance
                                                .viewTransactionHistory[index]
                                                .amountValue
                                                .toString()),
                                        const SizedBox(width: 6),
                                        Image.asset(
                                            Singleton
                                                .instance
                                                .viewTransactionHistory[index]
                                                .performance,
                                            height: 10),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            btnTitle: "More Details",
                            onTap: () {},
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
}
