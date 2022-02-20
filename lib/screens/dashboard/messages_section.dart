import 'package:bank_of_america_ui/screens/wallet/wallet_toggle_screens.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_tile/custom_list_tile.dart';

class MessagesSection extends StatelessWidget {
  const MessagesSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: size.width - 32,
          height: size.height * 0.38,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    child: Stack(
                      alignment: Alignment.center,
                      children: const [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                          size: 22,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 6,
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomListTile(
                title: "Remote Access Scam",
                subtitle:
                    "The banking industry has seen an increase in customers and business receiving cold calls from ...",
                widget: const Icon(
                  Icons.lock_open_outlined,
                  color: Colors.white70,
                  size: 19,
                ),
              ),
              const Divider(),
              CustomListTile(
                title: "Where can i find my IBAN?",
                subtitle:
                    "The banking industry has seen an increase in customers and business receiving cold calls from ...",
                widget: Image.asset(
                  "assets/icons/headphones_icon.png",
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF083C6F).withOpacity(0.70),
                      const Color(0xFF4DBEE0).withOpacity(0.70),
                      const Color(0xFF4DBEE0).withOpacity(0.70),
                    ],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WalletToggleScreens(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  textColor: Colors.white,
                  child: const Text(
                    "View More",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
