// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ownotes/constants/routes.dart';
import 'package:ownotes/services/auth/auth_service.dart';
import 'package:ownotes/services/auth/bloc/auth_bloc.dart';
import 'package:ownotes/services/auth/bloc/auth_events.dart';

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
          onPressed: () {
            context
                .read<AuthBloc>()
                .add(const AuthEventSendEmailVerification());
          },
          child: const Text('Resend verification email'),
        ),
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEventLogOut());
          },
          child: const Text('Restart'),
        )
      ]),
    );
  }
}
