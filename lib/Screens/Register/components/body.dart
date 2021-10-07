import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Register/components/background.dart';
import 'package:flutter_application_1/Screens/Login/components/header_login.dart';
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
              child: HeaderLogin(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Daftar Akun',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: kBlue,
                    ),
                  ),
                ),
              ],
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
                        text: 'Nama Pengguna',
                        icon: Icons.person,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: LoginTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        text: 'Email',
                        icon: Icons.mail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      // ignore: prefer_const_constructors
                      child: LoginTextField(
                        focus: false,
                        correct: false,
                        obscure: true,
                        text: 'Kata Sandi',
                        icon: Icons.lock,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      // ignore: prefer_const_constructors
                      child: LoginTextField(
                        focus: false,
                        correct: false,
                        obscure: true,
                        text: 'Ulangi Kata Sandi',
                        icon: Icons.lock,
                      ),
                    ),
                    PrimaryButton(
                      text: 'Daftar',
                      press: () {},
                      color: kOrange,
                      textColor: Colors.black,
                      width: size.width,
                      shadowColor: Colors.black,
                      borderColor: kOrange,
                    ),
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
