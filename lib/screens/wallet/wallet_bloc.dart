import 'package:flutter/material.dart';

class WalletBloc {
  late PageController pageController;

  bool tapped = false;
  int screenIndex = 0;
  int activePage = 0;

  // "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
  // "https://wallpaperaccess.com/full/2637581.jpg",
  // "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  List<Map<String, dynamic>> paymentCard = [
    {
      'bgStyle': "assets/images/card_bg.png",
      'cardType': "assets/images/visa-logo-png-2017.png",
      'cardNumber': "4035\t 3005\t 3980\t 4083",
      'exDate': "02/23",
    },
    {
      'bgStyle': "assets/images/card_bg.png",
      'cardType': "assets/images/mastercard-26135.png",
      'cardNumber': "5168\t 4412\t 2363\t 0339",
      'exDate': "06/24",
    },
    {
      'bgStyle': "assets/images/card_bg.png",
      'cardType': "assets/images/mastercard-26135.png",
      'cardNumber': "5168\t 3551\t 8051\t 9561",
      'exDate': "05/23",
    },
  ];

  

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: currentIndex == index ? 10 : 6,
        height: currentIndex == index ? 10 : 6,
        decoration: BoxDecoration(
            color:
                currentIndex == index ? Colors.grey.shade800 : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }


}
