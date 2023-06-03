import 'package:bantuin/models/login_model.dart';
import 'package:bantuin/view_models/login_viewmodel.dart';
import 'package:bantuin/widgets/register/register_textfield_component.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/auth/forgot_password.dart';
import 'package:bantuin/screens/auth/register_screen.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
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
                      lowerCase: true,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Kata sandi anda',
                      style: AppFont.labelTextForm,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      scrollPadding: const EdgeInsets.only(left: 10),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordController,
                      obscureText: obscure,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9!@#\$%^&*()_+-{}|<>?]"),
                        ),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan kata sandi anda';
                        } else if (value.length < 8) {
                          return 'Maaf kata sandi lama anda kurang dari 8 karakter';
                        } else if (value.length > 16) {
                          return 'Maaf kata sandi lama anda lebih dari 16 karakter';
                        } else if (value.contains(' ')) {
                          return 'Maaf kata sandi anda tidak boleh mengandung spasi';
                        } else if (value.contains(RegExp(r'[A-Z]')) &&
                            value.contains(RegExp(r'[a-z]')) &&
                            value.contains(RegExp(r'[0-9]'))) {
                          return null;
                        } else {
                          return 'Maaf kata sandi anda harus mengandung huruf besar, huruf kecil, dan angka';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Masukan kata sandi anda',
                        hintStyle: AppFont.hintTextField,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorPrimary.primary6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColorNeutral.neutral2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColorNeutral.neutral2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorPrimary.primary6),
                        ),
                        errorStyle: AppFont.errorTextForm,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()),
                          );
                        },
                        child: const Text(
                          'Lupa kata sandi?',
                          style: TextStyle(
                            color: AppColor.activeColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    Consumer<LoginViewModel>(
                      builder: (context, login, _) => ElevatedButton(
                        onPressed: () async {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            try {
                              await login.postLogin(
                                LoginModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                              Fluttertoast.showToast(
                                msg: "Berhasil Masuk",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomMenu(
                                        currentTab: 0,
                                        currentScreen: const HomePages())),
                              );
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Login Gagal'),
                                  content: Text(e.toString()),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        style: const ButtonStyle(
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(16.0)),
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
                        color: AppColor.activeColor,
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
