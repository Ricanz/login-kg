import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/ForgotPassword/components/background.dart';
import 'package:flutter_application_1/Screens/Login/components/text_field.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Background(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Header(),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          'Lupa Password',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: kBlue,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          'Masukkan email yang telah terdaftar',
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              LoginTextField(
                focus: false,
                correct: true,
                obscure: false,
                text: 'Nama Pengguna',
                icon: Icons.email,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: PrimaryButton(
                  text: 'Kirim',
                  press: () {
                    Navigator.pushNamed(context, '/validation');
                  },
                  color: kOrange,
                  textColor: Colors.black,
                  width: size.width,
                  shadowColor: Colors.black,
                  borderColor: kOrange,
                ),
              ),
            ],
          ),
        ),
      )
    ])));
  }
}
