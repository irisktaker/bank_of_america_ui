import 'package:bank_of_america_ui/screens/wallet/wallet_bloc.dart';
import 'package:bank_of_america_ui/singleton/singleton.dart';
import 'package:bank_of_america_ui/widgets/button/custom_main_btn.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_slider/animated_slider.dart';

WalletBloc _bloc = WalletBloc();

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
              padding: const EdgeInsets.all(16),
              width: size.width,
              height: size.height * 0.33,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.22),
                child: Column(
                  children: [
                    const Text(
                      "Available Balance",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
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
                        Text(
                          "\$ 1,448.00",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.4,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: PageView.builder(
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
                          cardNumber: _bloc.paymentCard[pagePosition]
                              ['cardNumber'],
                          exDate: _bloc.paymentCard[pagePosition]['exDate'],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bloc.indicators(
                    _bloc.paymentCard.length,
                    _bloc.activePage,
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Container(
            width: size.width,
            height: size.height,
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/three-o-clock-clock.png",
                      height: 16,
                      color: Colors.grey.shade900,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "History of Transactions",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: Singleton.instance.historyTransaction.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                      image: AssetImage(Singleton.instance
                                          .historyTransaction[index].logo),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(Singleton
                                    .instance.historyTransaction[index].date),
                                const Spacer(),
                                Text(Singleton.instance
                                    .historyTransaction[index].brandName),
                                const Spacer(flex: 2),
                                Text(Singleton.instance
                                        .historyTransaction[index].currency +
                                    " " +
                                    Singleton.instance.historyTransaction[index]
                                        .amountValue
                                        .toString()),
                                const SizedBox(width: 6),
                                Image.asset(
                                    Singleton.instance.historyTransaction[index]
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
                  ),
                ),
                CustomMainBtn(
                  onTap: () {},
                  widget: const Align(
                      alignment: Alignment.center,
                      child:  Text(
                        "View Transactions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
