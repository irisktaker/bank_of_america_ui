import '../../models/drawer_list.dart';
import '/screens/splash/splash_screen.dart';
import '/singleton/singleton.dart';
import '/widgets/button/custom_main_btn.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool shadow = true;
  int prevuesSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.80,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  setState(() {
                    shadow = !shadow;
                  });
                },
                child: CircleAvatar(
                  backgroundColor:
                      const Color(0xFFFFFFFF).withOpacity(shadow ? 0.2 : 0.0),
                  radius: 45,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(
                      "assets/images/profile.png",
                    ),
                    radius: shadow ? 35 : 45,
                  ),
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
          Expanded(
            child: Container(
              width: widget.size.width * 0.80,
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
                      width: widget.size.width * 0.80,
                      child: ListView.builder(
                        itemExtent: 65,
                        itemCount: Singleton.instance.drawerList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {

                              if (prevuesSelectedIndex == index) {
                                Singleton
                                        .instance.drawerList[index].isSelected =
                                    !Singleton
                                        .instance.drawerList[index].isSelected;
                              } else {
                                prevuesSelectedIndex = index;

                                for (DrawerList item
                                    in Singleton.instance.drawerList) {
                                  item.isSelected = false;
                                }

                                Singleton
                                        .instance.drawerList[index].isSelected =
                                    !Singleton
                                        .instance.drawerList[index].isSelected;
                              }
                              
                            });
                          },
                          child: drawerList(
                            icon: Singleton.instance.drawerList[index].icon,
                            txt: Singleton.instance.drawerList[index].text
                                .toUpperCase(),
                            color: Singleton
                                    .instance.drawerList[index].isSelected
                                ? const Color.fromARGB(255, 230, 248, 255)
                                : Singleton.instance.drawerList[index].bgColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomMainBtn(
                    width: 230,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()));
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
          ),
        ],
      ),
    );
  }

  Widget drawerList({
    required String icon,
    required String txt,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        margin: const EdgeInsets.only(right: 36),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
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
        ),
      ),
    );
  }
}
