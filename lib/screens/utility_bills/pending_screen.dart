import 'package:bank_of_america_ui/widgets/button/custom_main_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          containerBox(
            size,
            height: size.height * 0.18,
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
            height: size.height * 0.18,
            icon: "assets/icons/water_bill.png",
            bgIconColor: Colors.red[900]!,
            title: "Water Bill",
            amount: "\$ \t48.43",
            btnTextColor: Colors.white,
            btnColor: Colors.red[600]!,
            notificationIcon: Icons.error,
          ),
          const SizedBox(height: 10),
          containerBox(
            size,
            height: size.height * 0.38,
            icon: "assets/icons/tv.png",
            bgIconColor: const Color(0xFF4DBEE0),
            title: "TV Monthly Subscribe",
            amount: "\$ \t29.99",
            btnTextColor: Colors.grey,
            btnColor: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 10),
                monthlySubscriptionsInformation(
                  title: "Process Date",
                  child: Text(
                    "Wed, Nov. 03, 2022",
                    style: TextStyle(
                      color: Colors.red[600]!,
                      fontSize: 12,
                    ),
                  ),
                ),
                monthlySubscriptionsInformation(
                  title: "Process Date",
                  child: Row(
                    children: [
                      Text(
                        "Master Card **** 3456",
                        style: TextStyle(
                          color: Colors.grey[600]!,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 38,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/mastercard-26135.png",
                            ),
                            alignment: Alignment.topRight,
                            scale: 40,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                monthlySubscriptionsInformation(
                  title: "Autopay",
                  child: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column monthlySubscriptionsInformation({
    required title,
    required Widget child,
  }) {
    return Column(
      children: [
        const SizedBox(height: 7),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            child,
          ],
        ),
      ],
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
    Widget? child,
    required double height,
    IconData? notificationIcon,
  }) {
    return Container(
      width: size.width,
      height: height,
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
                width: 50,
                height: 50,
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
          SizedBox(
            child: child,
          ),
          Expanded(child: Container()),
          CustomMainBtn(
            onTap: () {},
            widget: Row(
              children: [
                const Spacer(flex: 5),
                const Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                ),
                const Spacer(flex: 3),
                Icon(
                  notificationIcon,
                  color: Colors.red[700],
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
