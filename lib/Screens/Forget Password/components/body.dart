import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Screens/Forget%20Password/components/background.dart';
import 'package:login_app/components/header_1.dart';
import 'package:login_app/components/text_field.dart';
import 'package:login_app/components/primary_button.dart';
import 'package:login_app/constants.dart';
import 'package:regexpattern/src/regex_extension.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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

                //TITLE HALAMAN
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //DESKRIPSI
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Masukkan Email Yang Telah Terdaftar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kLightBlue,
                    ),
                  ),
                ),

              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [

                    //EMAIL
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        icon: Icons.mail,
                        text: 'Email',
                        controller: _emailController,
                        validator: (value) {
                          String email = _emailController.text;

                          if (email == Null || email.isEmpty) {
                            return 'E-mail tidak boleh kosong';
                          } else if (!email.isEmail()){
                            return 'E-mail tidak valid! ';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
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
                              const SnackBar(content: Text('Sending Code')),
                            );
                            Navigator.pushNamed(context, '/validasi');
                          }
                        },
                      ),
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
