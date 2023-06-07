import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/profile/profile_screen2.dart';
import 'package:bantuin/view_models/user_viewmodel.dart';
import 'package:bantuin/widgets/register/register_textfield_component.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/profile/profile_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final UsersDetailModel usersDetail;

  const EditProfile({required this.usersDetail, Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.usersDetail.username;
    _emailController.text = widget.usersDetail.email;
    _jobController.text = widget.usersDetail.job;
    _phoneController.text = widget.usersDetail.phone;
  }

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
                'Edit Informasi Akun',
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.allow(RegExp(r"[A-Za-z ]"))
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
                      hint: 'Masukkan email',
                      type: 'email',
                      isEnabled: false,
                      email: true,
                      lowerCase: true,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Pekerjaan',
                      hint: 'Masukkan pekerjaan',
                      type: 'pekerjaan',
                      controller: _jobController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldComponent(
                      label: 'Phone',
                      hint: 'Masukkan phone',
                      type: 'phone',
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 36.0),
                    Consumer<UsersViewModel>(
                      builder: (context, user, _) => ElevatedButton(
                        onPressed: () async {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            try {
                              await user
                                  .updateUsers(
                                    PostUsersModel(
                                      username: _usernameController.text,
                                      email: _emailController.text,
                                      job: _jobController.text,
                                      phone: _phoneController.text,
                                    ),
                                    widget.usersDetail,
                                  )
                                  .then(
                                    (value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomMenu(
                                          currentTab: 4,
                                          currentScreen: ProfileScreen2(),
                                        ),
                                      ),
                                    ),
                                  );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          elevation: 0,
                          backgroundColor: AppColor.activeColor,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Simpan',
                            style: AppFont.textFillButtonActive,
                            textAlign: TextAlign.center,
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
