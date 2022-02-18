// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../singleton/singleton.dart';
import '../../widgets/Available_balance_card/Available_balance_card.dart';
import '../../widgets/history_of_transaction_card/history_of_transaction_card.dart';
import 'more_details_screen.dart';

class SavingScreen extends StatefulWidget {
  SavingScreen({Key? key}) : super(key: key);

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        AvailableBalanceCard(
          balance: "4,543.87",
          childe: Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300,
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  letterSpacing: 1.1,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text("Saving Account"),
                    const Spacer(flex: 2),
                    const Text("335-5437543-3-40-3"),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Bank Of America",
                          style: TextStyle(
                              fontFamily: 'Roboto_Condensed',
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          "assets/images/logo.png",
                          color: Colors.grey,
                          width: 28,
                          height: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          slider: Container(),
        ),
        HistoryOfTransactionCard(
          // widget.index !!!
          titleLogo: "assets/icons/three-o-clock-clock.png",
          title: "History of Transactions",
          child: ListView.builder(
            itemCount: Singleton.instance.savingHistoryTransaction.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(Singleton
                          .instance.savingHistoryTransaction[index].date),
                      const Spacer(),
                      Text(
                        Singleton
                            .instance.savingHistoryTransaction[index].brandName,
                      ),
                      const Spacer(flex: 2),
                      Text(Singleton.instance.savingHistoryTransaction[index]
                              .currency +
                          " " +
                          Singleton.instance.savingHistoryTransaction[index]
                              .amountValue
                              .toString()),
                      const SizedBox(width: 6),
                      Image.asset(
                          Singleton.instance.savingHistoryTransaction[index]
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
          btnTitle: "View Transactions",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MoreDetails()));
          },
        ),
      ],
    );
  }
}
