import 'package:bank_of_america_ui/screens/splash/splash_screen.dart';
import 'package:bank_of_america_ui/singleton/singleton.dart';
import 'package:bank_of_america_ui/widgets/button/custom_main_btn.dart';
import 'package:flutter/material.dart';

class DrawerScreen2 extends StatelessWidget {
  const DrawerScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width * 0.80,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [

            Expanded(
              child: SizedBox(
                width: size.width * 0.80,
                child: ListView.builder(
                  itemExtent: 65,
                  itemCount: Singleton.instance.drawerList.length,
                  itemBuilder: (context, index) => drawerList(
                    icon: Singleton.instance.drawerList[index].icon,
                    txt:
                        Singleton.instance.drawerList[index].text.toUpperCase(),
                  ),
                ),
              ),
            ),
            CustomMainBtn(
              width: 230,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row drawerList({
    required icon,
    required txt,
  }) {
    return Row(
      children: [
        const SizedBox(width: 26),
        Image.asset(
          icon,
          color: Colors.grey,
        ),
        const SizedBox(width: 16),
        Text(
          txt,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.80,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                radius: 45,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile.png",
                  ),
                  radius: 35,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: const [
                  Text(
                    "Hello John Doe!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Text(
                    "john.doe@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const DrawerScreen2(),
        ],
      ),
    );
  }
}
