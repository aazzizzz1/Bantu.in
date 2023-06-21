import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:bantuin/constants/constant.dart';

class EmailConfirmation extends StatefulWidget {
  const EmailConfirmation({super.key});

  @override
  State<EmailConfirmation> createState() => EmailConfirmationState();
}

class EmailConfirmationState extends State<EmailConfirmation> {
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
                'Periksa email anda untuk menverifikasi akun.',
                style: AppFont.semiBold20,
              ),
              const SizedBox(height: 24),
              Text(
                'Silahkan periksa email anda dan mengklik link verifikasi akun yang telah dikirim.',
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
