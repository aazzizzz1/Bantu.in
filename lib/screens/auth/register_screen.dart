import 'package:bantuin/models/register_model.dart';
import 'package:bantuin/screens/auth/login_screen.dart';
import 'package:bantuin/view_models/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../widgets/register/register_textfield_component.dart';
import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar akun',
                style: AppFont.textTitleScreen,
              ),
              const SizedBox(
                height: 36,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: AppFont.labelTextForm,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      scrollPadding: const EdgeInsets.only(left: 10),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters:[
                              LengthLimitingTextInputFormatter(16),
                              FilteringTextInputFormatter.allow(
                                RegExp("[A-Za-z]"),
                              ),
                            ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan username anda';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Username',
                        hintStyle: AppFont.hintTextField,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColorPrimary.primary6)),
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
                                BorderSide(color: AppColorPrimary.primary6)),
                        errorStyle: AppFont.errorTextForm,
                      ),
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Email',
                      hint: 'Masukan email',
                      type: 'email',
                      email: true,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Nomor telepon',
                      style: AppFont.labelTextForm,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      scrollPadding: const EdgeInsets.only(left: 10),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters:[
                              LengthLimitingTextInputFormatter(16),
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9]"),
                              ),
                            ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan nomor telepon anda';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Nomor telepon',
                        hintStyle: AppFont.hintTextField,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColorPrimary.primary6)),
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
                                BorderSide(color: AppColorPrimary.primary6)),
                        errorStyle: AppFont.errorTextForm,
                      ),
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Pekerjaan',
                      hint: 'Masukan pekerjaan',
                      type: 'pekerjaan',
                      controller: _jobController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Kata sandi',
                      hint: 'Masukan kata sandi',
                      type: 'kata sandi',
                      description:
                          'Kata sandi harus terdiri dari 8 huruf, 1 huruf besar, dan 1 angka',
                      controller: _passwordController,
                      icon: Icons.remove_red_eye_outlined,
                      obscure: true,
                    ),
                    const SizedBox(height: 20.0),
                    // CONFIRM PASSWORD
                    Text(
                      'Ulangi kata sandi',
                      style: AppFont.labelTextForm,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      scrollPadding: const EdgeInsets.only(left: 10),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordConfirmationController,
                      obscureText: obscure == null ? false : obscure,
                      inputFormatters: obscure != null
                          ? [
                              LengthLimitingTextInputFormatter(16),
                              FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z0-9]+"),
                              ),
                            ]
                          : null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan ulang kata sandi anda';
                        }
                        if (_passwordConfirmationController.text !=
                            _passwordController.text) {
                          return 'Maaf kata sandi anda belum sesuai dengan sebelumnya';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Masukan kata sandi lagi',
                        hintStyle: AppFont.hintTextField,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColorPrimary.primary6)),
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
                                BorderSide(color: AppColorPrimary.primary6)),
                        errorStyle: AppFont.errorTextForm,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (obscure) {
                                obscure = false;
                              } else {
                                obscure = true;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    Consumer<RegisterViewModel>(
                      builder: (context, register, _) => ElevatedButton(
                        onPressed: () async {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            try {
                              await register.postRegister(
                                RegisterModel(
                                  username: _usernameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  job: _jobController.text,
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _passwordConfirmationController.text,
                                ),
                              );
                              Fluttertoast.showToast(
                                msg: "Berhasil Mendaftar",
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
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Registrasi Gagal'),
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
                            'Daftar',
                            style: AppFont.textFillButtonActive,
                          ),
                        ),
                      ),
                    )
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
