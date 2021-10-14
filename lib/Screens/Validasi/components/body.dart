// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:login_app/Screens/Validasi/components/background.dart';
import 'package:login_app/components/header_1.dart';
import 'package:login_app/components/text_field.dart';
import 'package:login_app/components/primary_button.dart';
import 'package:login_app/constants.dart';
import 'package:regexpattern/src/regex_extension.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController _codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: HeaderLogin(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //TITLE HALAMAN
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Validasi',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: kBlue,
                  ),
                ),
              ),

            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //DESKRIPSI
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Masukkan kode yang diberikan melalui E-mail anda yang terdaftar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kLightBlue,
                  ),
                ),
              ),

            ],
          ),

          Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [

                    //code
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: true,
                        icon: Icons.security,
                        text: 'Kode',
                        controller: _codeController,
                        validator: (value) {
                          String code = _codeController.text;

                          if (code == Null || code.isEmpty) {
                            return 'Masukan Kode!';
                          } else if (!code.isNumeric()){
                            return 'Kode berupa numerik!';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    //TOMBOL KIRIM
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryButton(
                        text: 'Kirim',
                        color: kOrange,
                        textColor: Colors.black,
                        width: size.width,
                        shadowColor: Colors.black,
                        borderColor: kOrange,
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Code Validation Successful')),
                            );
                            Navigator.pushNamed(context, '/change-password');
                          }
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

          Container(
            child:Image(
              image: AssetImage('assets/images/mid-2.png'),
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }
}