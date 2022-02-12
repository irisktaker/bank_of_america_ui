import 'dart:ui';
import 'package:flutter/material.dart';

import '../../widgets/background/background_widget.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/button/check_box.dart';
import '../../widgets/button/custom_main_btn.dart';
import '../../widgets/text_field/text_form_field.dart';
import 'login_screen_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginScreenBloc _bloc = LoginScreenBloc();

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
                Form(
                  key: _formKey,
                  child: Container(
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
                          controller: _bloc.bankIDController,
                          validator: (value) => _bloc.bankIdValidate(value),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) => _bloc.passwordController,
                          onTap: () {},
                        ),
                        CustomTextFormField(
                          title: "Password",
                          fieldText: "******",
                          controller: _bloc.passwordController,
                          validator: (value) => _bloc.passwordValidate(value),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (value) {},
                          onTap: () {},
                        ),
                        CustomCheckBox(
                          txt: "Remember my ID for future login",
                          value: _bloc.idCheck,
                          onChanged: (value) => setState(
                            () => _bloc.idCheck = value,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomCheckBox(
                          txt: "Use fingerprint recognition next time",
                          value: _bloc.fingerprintCheck,
                          onChanged: (value) => setState(
                            () => _bloc.fingerprintCheck = value,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomMainBtn(
                          onTap: () {
                            setState(() {
                              _bloc.checkValidate;
                              _formKey.currentState!.validate();

                              // _bloc.singWithFingerPrint(context);
                            });
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
                      ],
                    ),
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
