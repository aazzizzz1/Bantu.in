import 'package:bantuin/components/register_textfield_component.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/auth/register_screen.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        margin: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(40.0),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                  'lib/assets/images/logoApp.svg',
                  width: 200,
                  height: 100,
                ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldComponent(
                        label: 'Email',
                        hint: 'Masukan email',
                        type: 'email',
                        email: true,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20.0),
                      TextFieldComponent(
                        label: 'Kata sandi',
                        hint: 'Masukan kata sandi',
                        type: 'kata sandi',
                        description:
                            'Kata sandi harus terdiri dari 8 huruf, 1 huruf besar, 1 angka',
                        controller: _passwordController,
                        icon: Icons.remove_red_eye_outlined,
                        obscure: true,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        onPressed: () {
                          // tambahkan kode untuk memproses tindakan lupa kata sandi di sini
                        },
                        child: const Text(
                          'Lupa kata sandi?',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                                          ),
                      ),
                      // CONFIRM PASSWORD
                      const SizedBox(height: 36.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomMenu(currentTab: 0, currentScreen: const HomePages())),
                            );
                          // final isValidForm = _formKey.currentState!.validate();
                          // if (isValidForm) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             BottomMenu(currentTab: 0, currentScreen: const HomePages())),
                          //   );
                          // }
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.activeColor),
                        ),
                        child: Center(
                          child: Text(
                            'Masuk',
                            style: AppFont.textFillButtonActive,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Belum punya akun? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigasi ke halaman pendaftaran
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RegisterScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
