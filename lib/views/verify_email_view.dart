// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ownotes/constants/routes.dart';
import 'package:ownotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email verification')),
      body: Column(children: [
        const Text(
          "We've sent you an email verification. Please verify before using Ownotes",
        ),
        const Text(
          "If you haven't received the email, press the button below",
        ),
        TextButton(
          onPressed: () async {
            await AuthService.firebase().sendEmailVerification();
          },
          child: const Text('Resend verification email'),
        ),
        TextButton(
          onPressed: () async {
            await AuthService.firebase().logOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
          },
          child: const Text('Restart'),
        )
      ]),
    );
  }
}
