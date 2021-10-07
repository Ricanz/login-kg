import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Validation/components/background.dart';
import 'package:flutter_application_1/Screens/ForgotPassword/components/header.dart';
import 'package:flutter_application_1/Screens/Login/components/icon_btn.dart';
import 'package:flutter_application_1/Screens/Login/components/text_field.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Header(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Lupa Kata Sandi',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: kBlue,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Masukkan Email yang telah terdaftar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kLightBlue,
              ),
            ),
            Form(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: LoginTextField(
                          focus: false,
                          correct: true,
                          obscure: false,
                          text: 'Email',
                          icon: Icons.mail),
                    ),
                    PrimaryButton(
                      text: 'Kirim',
                      press: () {
                        Navigator.pushNamed(context, '/changePassword');
                      },
                      color: kOrange,
                      textColor: Colors.black,
                      width: size.width,
                      shadowColor: Colors.black,
                      borderColor: kOrange,
                    ),

                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'Lupa kata sandi?',
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
