import 'package:bantuin/models/password_model.dart';
import 'package:bantuin/models/post_password_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/profile/profile_screen2.dart';
import 'package:bantuin/view_models/password_viewmodel.dart';
import 'package:bantuin/widgets/register/register_textfield_component.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/profile/profile_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditPasswordProfile extends StatefulWidget {
  EditPasswordProfile({Key? key}) : super(key: key);

  @override
  State<EditPasswordProfile> createState() => _EditPasswordProfileState();
}

class _EditPasswordProfileState extends State<EditPasswordProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordOldController = TextEditingController();
  final TextEditingController _passwordNewController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  bool obscure = true;
  bool obscure2 = true;
  bool obscure3 = true;

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
                  currentTab: 4,
                  currentScreen: ProfileScreen2(),
                ),
              ),
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
                      controller: _passwordOldController,
                      obscureText: obscure,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9!@#\$%^&*()_+-{}|<>?]"),
                        ),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan kata sandi lama anda';
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
                        hintText: 'Masukan kata sandi lama anda',
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
                    //Kata sandi baru
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Kata sandi baru',
                      style: AppFont.labelTextForm,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      scrollPadding: const EdgeInsets.only(left: 10),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordNewController,
                      obscureText: obscure2,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9!@#\$%^&*()_+-{}|<>?]"),
                        ),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan kata sandi baru anda';
                        } else if (value.length < 8) {
                          return 'Maaf kata sandi baru anda kurang dari 8 karakter';
                        } else if (value.length > 16) {
                          return 'Maaf kata sandi baru anda lebih dari 16 karakter';
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
                        hintText: 'Masukan kata sandi baru anda',
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
                              obscure2 = !obscure2;
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
                      obscureText: obscure3,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9!@#\$%^&*()_+-{}|<>?]"),
                        ),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Maaf anda belum memasukan ulang kata sandi baru anda';
                        }
                        if (_passwordConfirmationController.text !=
                            _passwordNewController.text) {
                          return 'Maaf kata sandi baru anda belum sesuai dengan sebelumnya';
                        } else if (value.length < 8) {
                          return 'Maaf kata sandi baru anda kurang dari 8 karakter';
                        }
                        if (value.length > 16) {
                          return 'Maaf kata sandi baru anda lebih dari 16 karakter';
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
                        hintText: 'Masukan kata sandi baru anda lagi',
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
                              obscure3 = !obscure3;
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
                    Consumer<PasswordViewModel>(
                      builder: (context, pass, _) => ElevatedButton(
                        onPressed: () async {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            try {
                              await pass.updatePassword(
                                PostPasswordModel(
                                  current_password: _passwordOldController.text,
                                  password: _passwordNewController.text,
                                  password_confirmation:
                                      _passwordConfirmationController.text,
                                ),
                              );
                              Fluttertoast.showToast(
                                msg: "Berhasil Mengubah password",
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
                                    currentTab: 4,
                                    currentScreen: ProfileScreen2(),
                                  ),
                                ),
                              );
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Update Password Gagal'),
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
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          elevation: 0,
                          backgroundColor: AppColor.activeColor,
                        ),
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: AppFont.textFillButtonActive,
                          ),
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
