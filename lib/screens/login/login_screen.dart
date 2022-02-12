import 'dart:ui';
import 'package:flutter/material.dart';

import '../../widgets/background/background_widget.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/button/check_box.dart';
import '/screens/dashboard/dashboard.dart';
import '../fingerprint/fingerprint_screen.dart';
import '../../widgets/text_field/text_form_field.dart';
import 'login_screen_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenBloc _loginScreenBloc = LoginScreenBloc();

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
                Expanded(flex: 3, child: Container()),
                Container(
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
                          Expanded(flex: 4, child: Container()),
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(flex: 3, child: Container()),
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
                      CustomTextFormField(
                        title: "PRO ID",
                        fieldText: "Enter your bank ID",
                        controller: _loginScreenBloc.bankIDController,
                        validator: _loginScreenBloc.bankIdValidate,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) =>
                            _loginScreenBloc.passwordController,
                        onTap: () {},
                      ),
                      CustomTextFormField(
                        title: "Password",
                        fieldText: "******",
                        controller: _loginScreenBloc.passwordController,
                        validator: _loginScreenBloc.passwordValidate,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {},
                        onTap: () {},
                      ),
                      CustomCheckBox(
                        txt: "Remember my ID for future login",
                        value: _loginScreenBloc.idCheck,
                        onChanged: (value) => setState(
                          () => _loginScreenBloc.idCheck = value,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomCheckBox(
                        txt: "Use fingerprint recognition next time",
                        value: _loginScreenBloc.fingerprintCheck,
                        onChanged: (value) => setState(
                          () => _loginScreenBloc.fingerprintCheck = value,
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
                            _loginScreenBloc.fingerprintCheck == true
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
}
