import 'package:bantuin/components/register_textfield_component.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/auth/email_otp.dart';
import 'package:bantuin/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lupa Kata Sandi',
                style: AppFont.textTitleScreen,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Masukan email anda dibawah untuk mereset kata sandi anda.',
                style: AppFont.medium14,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Email',
                      hint: 'Masukan email',
                      type: 'email',
                      email: true,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 36.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const ProfileScreen()),
                        // );
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailOtp(key: null),
                                ),
                          );
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.activeColor),
                      ),
                      child: Center(
                        child: Text(
                          'Selanjutnya',
                          style: AppFont.textFillButtonActive,
                        ),
                      ),
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
