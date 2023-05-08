import 'package:bantuin/widgets/register/register_textfield_component.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/profile/profile_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPasswordProfile extends StatefulWidget {
  const EditPasswordProfile({super.key});

  @override
  State<EditPasswordProfile> createState() => _EditPasswordProfileState();
}

class _EditPasswordProfileState extends State<EditPasswordProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
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
                  builder: (context) => BottomMenu(
                      currentTab: 3, currentScreen: const ProfileScreen())),
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
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ubah Kata Sandi',
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
                      'Kata sandi lama',
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
                                RegExp("[a-zA-Z0-9 ]"),
                              ),
                            ]
                          : null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan kata sandi lama anda';
                        }
                        if (_passwordConfirmationController.text !=
                            _passwordController.text) {
                          return 'Maaf kata sandi lama anda tidak sesuai ';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Masukan kata sandi lama anda ',
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
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Kata sandi baru',
                      hint: 'Masukan kata sandi baru',
                      type: 'kata sandi baru',
                      description:
                          'Kata sandi harus terdiri dari 8 huruf, 1 huruf besar, 1 angka',
                      controller: _passwordController,
                      icon: Icons.remove_red_eye_outlined,
                      obscure: true,
                    ),
                    const SizedBox(height: 20.0),
                    // CONFIRM PASSWORD
                    Text(
                      'Ulangi kata sandi baru',
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
                                RegExp("[a-zA-Z0-9 ]"),
                              ),
                            ]
                          : null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan ulang kata sandi baru anda';
                        }
                        if (_passwordConfirmationController.text !=
                            _passwordController.text) {
                          return 'Maaf kata sandi baru anda belum sesuai dengan sebelumnya';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorNeutral.neutral1,
                        hintText: 'Masukan kata sandi baru anda lagi',
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
                                builder: (context) => BottomMenu(
                                    currentTab: 3,
                                    currentScreen: const ProfileScreen())),
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
                          'Simpan',
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
