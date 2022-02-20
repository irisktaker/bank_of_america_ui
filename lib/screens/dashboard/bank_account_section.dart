import 'package:bank_of_america_ui/screens/wallet/wallet_toggle_screens.dart';
import 'package:flutter/material.dart';

class BankAccountSection extends StatelessWidget {
  const BankAccountSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 32,
      height: size.height * 0.20,
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
          GestureDetector(
            onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletToggleScreens(),
                  ),
                )),
            child: Column(
              children: [
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
        ],
      ),
    );
  }
}
