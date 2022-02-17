import 'package:bank_of_america_ui/screens/wallet/wallet_bloc.dart';
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
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(),
          ),
        ),
      ],
    );
  }
}
