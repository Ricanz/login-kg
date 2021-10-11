import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/background.dart';
import 'package:login_app/components/header_1.dart';
import 'package:login_app/components/text_field.dart';
import 'package:login_app/components/primary_button.dart';
import 'package:login_app/constants.dart';
import 'package:regexpattern/src/regex_extension.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: MainBackground(
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
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [

                    //NAMA PENGGUNA
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        icon: Icons.person,
                        text: 'Nama Pengguna',
                        controller: _userController,
                        validator: (value) {
                          String username = _userController.text;

                          if (username == Null || username.isEmpty) {
                            return 'Nama Pengguna tidak boleh kosong!';
                          } else if (!username.isUsername()) {
                            return 'Nama Pengguna tidak valid!';
                          } else if (username.length < 8) {
                            return 'Nama Pengguna minimal 8 karakter!';
                          } else if (username.length > 30) {
                            return 'Nama Pengguna maximal 30 karakter!';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    //EMAIL
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: false,
                        icon: Icons.email,
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
                    
                    //KATA SANDI
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: true,
                        icon: Icons.lock,
                        text: 'Kata Sandi',
                        controller: _passwordController,
                        validator: (value) {
                          String password = _passwordController.text;

                          if (password == Null || password.isEmpty) {
                            return 'Kata Sandi tidak boleh kosong!';
                          } else if (password.length < 8) {
                            return 'Kata Sandi minimal 8 karakter atau lebih!';
                          } else if (!password.isPasswordNormal1()) { //BELUM FIX, TENTUKAN STANDARISASI DULU (EASY, HARD, DLL ?)
                            return 'Kekuatan Kata Sandi lemah!';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    //ULANGI KATA SANDI
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryTextField(
                        focus: false,
                        correct: true,
                        obscure: true,
                        icon: Icons.password_outlined,
                        text: 'Ulangi Kata Sandi',
                        controller: _repeatPasswordController,
                        validator: (value) {
                          String repeatPassword = _repeatPasswordController.text;

                          if (repeatPassword == Null || repeatPassword.isEmpty) {
                            return 'Ulangi Kata Sandi tidak boleh kosong';
                          } else if (value != _passwordController.text) {
                            return 'Ulangi Kata Sandi tidak sama';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    //TOMBOL DAFTAR
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PrimaryButton(
                        text: 'Daftar',
                        color: kOrange,
                        textColor: Colors.black,
                        width: size.width,
                        shadowColor: Colors.black,
                        borderColor: kOrange,
                        press:() {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Account Created Successfully')),
                            );
                            Navigator.pushNamed(context, '/login');
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
