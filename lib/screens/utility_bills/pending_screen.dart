import 'package:bank_of_america_ui/widgets/button/custom_main_btn.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          containerBox(
            size,
            icon: "assets/icons/electricity_bill.png",
            bgIconColor: const Color(0xFF4DBEE0),
            title: "Electricity Bill",
            amount: "\$ \t176.99",
            btnTextColor: Colors.grey,
            btnColor: Colors.white,
          ),
          const SizedBox(height: 10),
          containerBox(
            size,
            icon: "assets/icons/water_bill.png",
            bgIconColor: Colors.red[900]!,
            title: "Water Bill",
            amount: "\$ \t48.43",
            btnTextColor: Colors.white,
            btnColor: Colors.orange[800]!,
          ),
          const SizedBox(height: 10),
          Container(
            width: size.width,
            height: size.height * 0.38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }

  Container containerBox(
    Size size, {
    required String icon,
    required Color bgIconColor,
    required String title,
    required String amount,
    required Color btnTextColor,
    required Color btnColor,
  }) {
    return Container(
      width: size.width,
      height: size.height * 0.18,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: bgIconColor,
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: AssetImage(icon),
                    scale: 0.8,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF083C6F),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 194, 45, 34),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 90,
                  height: 45,
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(2, -1),
                        blurRadius: 0.2,
                        spreadRadius: 0.2,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-1, 2),
                        blurRadius: 0.2,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: btnTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          CustomMainBtn(
            onTap: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
