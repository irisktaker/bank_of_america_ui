import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_logo_app_bar.dart';
import '/widgets/button/custom_main_btn.dart';
import '/singleton/singleton.dart';
import '/widgets/background/background_widget.dart';
import '../dashboard/dashboard.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customLogoAppBar(
        leading: InkWell(
          onTap: (() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashBoardScreen()))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 16),
              Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                "Back",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        actions: [
          const SizedBox(width: 60,),
        ],
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width / 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    return containerBox(
                      size,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Expanded(child: SizedBox()),
                            Image.asset(
                              Singleton.instance.settingsList[index].icon,
                              scale: 0.8,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              Singleton.instance.settingsList[index].title
                                  .toUpperCase(),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            CustomMainBtn(
                                onTap: () {},
                                height: 38,
                                widget: const Center(
                                  child: Text(
                                    "Details",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: Singleton.instance.settingsList.length,
                  shrinkWrap: true,
                ),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }

  Column containerBox(Size size, {required Widget child}) {
    return Column(
      children: [
        Container(
          width: size.width / 2,
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: child,
        ),
        styleForContainer(
          size,
          width: size.width / 2 - 64,
        ),
        styleForContainer(
          size,
          width: size.width / 2 - 84,
        ),
      ],
    );
  }

  Container styleForContainer(Size size, {required double width}) {
    return Container(
      width: width,
      height: 5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
    );
  }
}
