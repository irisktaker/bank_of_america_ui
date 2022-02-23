import 'dart:ui';
import 'package:flutter/material.dart';

import '../drawer/drawer.dart';
import '/screens/utility_bills/pending_screen.dart';
import '/screens/utility_bills/subscriptions_screen.dart';
import '/screens/utility_bills/utility_bills_bloc.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/background/background_widget.dart';
import '../dashboard/dashboard.dart';

class UtilityBillsScreen extends StatefulWidget {
  const UtilityBillsScreen({Key? key}) : super(key: key);

  @override
  State<UtilityBillsScreen> createState() => _UtilityBillsScreenState();
}

class _UtilityBillsScreenState extends State<UtilityBillsScreen> {
  final UtilityBillsBloc _bloc = UtilityBillsBloc();

  void selectedScreen(int index) {
    setState(() {
      _bloc.screenIndex = index;
    });
  }

  late List<Map<String, dynamic>> utilityBillsScreens;

  @override
  void initState() {
    super.initState();

    utilityBillsScreens = [
      {
        'screen': const PendingScreen(),
        'title': 'pending',
      },
      {
        'screen': const SubscriptionsScreen(),
        'title': 'subscriptions',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
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
        title: "utility bills".toUpperCase(),
        onTap: () {
          setState(() {
            _bloc.tapped = !_bloc.tapped;
          });
        },
      ),
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: SizedBox(
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _bloc.tapped ? DrawerScreen(size: size) : Container(),
                  SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemExtent: 190,
                                itemCount: utilityBillsScreens.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          selectedScreen(index);
                                        },
                                        child: Text(
                                          utilityBillsScreens[index]['title']
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      _bloc.screenIndex == index
                                          ? Container(
                                              width: 55,
                                              height: 3,
                                              color: Colors.white,
                                            )
                                          : Container(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: SizedBox(
                              child: utilityBillsScreens[_bloc.screenIndex]['screen'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
