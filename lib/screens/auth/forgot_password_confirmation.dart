import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:bantuin/constants/constant.dart';

class ForgotPasswordConfirmation extends StatefulWidget {
  const ForgotPasswordConfirmation({super.key});

  @override
  State<ForgotPasswordConfirmation> createState() =>
      ForgotPasswordConfirmationState();
}

class ForgotPasswordConfirmationState
    extends State<ForgotPasswordConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(top: 175),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Periksa email anda untuk mereset kata sandi.',
                style: AppFont.semiBold20,
              ),
              const SizedBox(height: 24),
              Text(
                'Silahkan periksa email anda dan mengklik link ubah kata sandi yang telah dikirim.',
                style: AppFont.medium14,
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Belum menerima email? ',
                        style: AppFont.hintTextField),
                    TextSpan(
                        text: ' Kirim lagi', style: AppFont.textButtonActive),
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
