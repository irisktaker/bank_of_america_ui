// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:bank_of_america_ui/widgets/button/custom_main_btn.dart';

import '../../widgets/Available_balance_card/Available_balance_card.dart';
import '../../widgets/history_of_transaction_card/history_of_transaction_card.dart';
import '/screens/wallet/wallet_bloc.dart';
import '/singleton/singleton.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_slider/animated_slider.dart';
import 'more_details_screen.dart';

WalletBloc _bloc = WalletBloc();

class CreditCardScreen extends StatefulWidget {
  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  void initState() {
    _bloc.pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvailableBalanceCard(
          balance: "1,448.00",
          childe: PageView.builder(
            itemCount: _bloc.paymentCard.length,
            pageSnapping: true,
            controller: _bloc.pageController,
            onPageChanged: (page) {
              setState(() {
                _bloc.activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              //checking active position
              bool active = pagePosition == _bloc.activePage;
              return slider(
                _bloc.paymentCard,
                pagePosition,
                active,
                image: _bloc.paymentCard[pagePosition]['bgStyle'],
                cardType: _bloc.paymentCard[pagePosition]['cardType'],
                cardNumber: _bloc.paymentCard[pagePosition]['cardNumber'],
                exDate: _bloc.paymentCard[pagePosition]['exDate'],
              );
            },
          ),
          slider: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bloc.indicators(
              _bloc.paymentCard.length,
              _bloc.activePage,
            ),
          ),
        ),
        HistoryOfTransactionCard(
          // widget.index !!!
          titleLogo: "assets/icons/three-o-clock-clock.png",
          title: "History of Transactions",
          child: ListView.builder(
            itemCount: Singleton.instance.creditHistoryTransaction.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.grey.shade200,
                          image: DecorationImage(
                            image: AssetImage(Singleton
                                .instance.creditHistoryTransaction[index].logo),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(Singleton
                          .instance.creditHistoryTransaction[index].date),
                      const Spacer(),
                      Text(
                        Singleton
                            .instance.creditHistoryTransaction[index].brandName,
                      ),
                      const Spacer(flex: 2),
                      Text(Singleton.instance.creditHistoryTransaction[index]
                              .currency +
                          " " +
                          Singleton.instance.creditHistoryTransaction[index]
                              .amountValue
                              .toString()),
                      const SizedBox(width: 6),
                      Image.asset(
                          Singleton.instance.creditHistoryTransaction[index]
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const TransactionsHistory()));
          },
        ),
      ],
    );
  }
}
