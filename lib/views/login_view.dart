// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ownotes/constants/routes.dart';
import 'package:ownotes/services/auth/bloc/auth_bloc.dart';
import 'package:ownotes/services/auth/bloc/auth_events.dart';
import 'package:ownotes/utilities/dialogs/error_dialog.dart';
import 'package:ownotes/services/auth/auth_exceptions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'email',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'password'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                context.read<AuthBloc>().add(
                      AuthEventLogIn(
                        email,
                        password,
                      ),
                    );
                //TODO repair exception handling with Bloc
              } on WrongCredentialsAuthException {
                await showErrorDialog(context, 'Wrong credentials');
              } on UserNotFoundAuthException {
                await showErrorDialog(context, "User not found");
              } on WrongPasswordAuthException {
                await showErrorDialog(
                  context,
                  "Wrong password",
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  "Authentication error",
                );
              }
            },
            child: const Text("Login"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Not registered yet? Sign up here!'))
        ],
      ),
    );
  }
}
