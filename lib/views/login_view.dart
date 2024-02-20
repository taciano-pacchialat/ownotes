// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ownotes/constants/routes.dart';
import 'package:ownotes/services/auth/auth_service.dart';
import 'package:ownotes/utilities/show_error_dialog.dart';
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
                await AuthService.firebase()
                    .logIn(email: email, password: password);
                final user = AuthService.firebase().currentUser;
                if (user?.isEmailVerified ?? false) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    notesRoute,
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    verifyEmailRoute,
                    (route) => false,
                  );
                }
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
