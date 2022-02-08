import 'dart:ui';
import 'package:bank_of_america_ui/screens/dashboard.dart';
import 'package:bank_of_america_ui/utils/constants.dart';

import '/widgets/background_widget.dart';
import '/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'fingerprint_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _bankIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? idCheck = false;
  bool? fingerprintCheck = false;

  String bankIdValidate(value) {
    value!.isEmpty ? "Please enter your bank ID" : null;

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          automaticallyImplyLeading: false,
        ),
        body: BackgroundWidget(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    top: 26,
                    left: 26,
                    right: 26,
                    bottom: 16,
                  ),
                  margin: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(),
                          ),
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      textFormField(
                        title: "PRO ID",
                        fieldText: "Enter your bank ID",
                        controller: _bankIDController,
                        validator: bankIdValidate,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) => _passwordController,
                        onTap: () {},
                      ),
                      textFormField(
                        title: "Password",
                        fieldText: "******",
                        controller: _passwordController,
                        validator: (value) {},
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {},
                        onTap: () {},
                      ),
                      checkBox(
                        txt: "Remember my ID for future login",
                        value: idCheck,
                        onChanged: (value) => setState(
                          () => idCheck = value,
                        ),
                      ),
                      const SizedBox(height: 8),
                      checkBox(
                        txt: "Use fingerprint recognition next time",
                        value: fingerprintCheck,
                        onChanged: (value) => setState(
                          () => fingerprintCheck = value,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 44,
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
                            fingerprintCheck == true
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FingerPrint(),
                                    ),
                                  )
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DashBoardScreen(),
                                    ),
                                  );
                          },
                          height: 44,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          textColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign in",
                              ),
                              SizedBox(width: 16),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row checkBox({
    required String txt,
    required bool? value,
    required void Function(bool?)? onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 9.5,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 7.5,
            child: Checkbox(
              checkColor: Colors.blue,
              fillColor: MaterialStateProperty.all(Colors.white),
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          txt,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Column textFormField({
    required String title,
    required String fieldText,
    required TextEditingController? controller,
    required String? Function(String?)? validator,
    bool obscureText = false,
    TextInputType? keyboardType = TextInputType.text,
    required void Function(String)? onFieldSubmitted,
    required void Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: fieldText,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            enabledBorder: underLineBorder(),
            focusedBorder: underLineBorder(),
            disabledBorder: underLineBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  UnderlineInputBorder underLineBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
