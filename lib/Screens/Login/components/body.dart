// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/background.dart';
import 'package:login_app/components/header_1.dart';
import 'package:login_app/Screens/Login/components/icon_btn.dart';
import 'package:login_app/components/text_field.dart';
import 'package:login_app/components/primary_button.dart';
import 'package:login_app/constants.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //HEADER
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: HeaderLogin(),
            ),

            //TITLE HALAMAN
            Container(
              child: Text(
                'Masuk Akun',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kBlue,
                ),
              ),
            ),

            //FORM LOGIN
            Container(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: 
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
      
                      //NAMA PENGGUNA
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: PrimaryTextField(
                          focus: false,
                          correct: true,
                          obscure: false,
                          text: 'Nama Pengguna',
                          icon: Icons.person,
                          controller: _userController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Pengguna tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
      
                      //KATA SANDI
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: PrimaryTextField(
                          focus: false,
                          correct: true,
                          obscure: true,
                          text: 'Kata Sandi',
                          icon: Icons.lock,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kata Sandi tidak boleh kosong';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
      
                      //TOMBOL MASUK
                      PrimaryButton(
                        text: 'Masuk',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Process')),
                            );
                            Navigator.pushNamed(context, '/');
                          }
                        },
                        color: kOrange,
                        textColor: Colors.black,
                        width: size.width,
                        shadowColor: Colors.black,
                        borderColor: kOrange,
                      ),
      
                      //LUPA KATA SANDI
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lupa kata sandi, ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: 'klik disini',
                                style: TextStyle(
                                  color: kOrange,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/forget-password');
                                  })
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //PEMBATAS
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: size.width * 0.35,
                    image: AssetImage('assets/images/thick-line.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Atau',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    width: size.width * 0.35,
                    image: AssetImage('assets/images/thick-line.png'),
                  ),
                ],
              ),
            ),
      
            //LOGIN SSO
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [

                  //LOGIN GOOGLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconBtn(
                              text: 'Lanjutkan dengan Google',
                              press: () {},
                              icon: Image.asset('assets/images/google.png'),
                              color: Colors.white,
                              textColor: Colors.black,
                              borderColor: kBlue,
                              shadowColor: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  //LOGIN FACEBOOK
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconBtn(
                              text: 'Lanjutkan dengan Facebook',
                              press: () {},
                              icon: Image.asset('assets/images/facebook.png'),
                              color: Colors.white,
                              textColor: Colors.black,
                              borderColor: kBlue,
                              shadowColor: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
