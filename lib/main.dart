import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ownotes/firebase_options.dart';
import 'package:ownotes/views/login_view.dart';
import 'package:ownotes/views/register_view.dart';
import 'package:ownotes/views/verify_email_view.dart';

// c16, min 26

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register': (context) => const RegisterView()
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            if (user.emailVerified) {
              print('Email verified');
            } else {
              return const VerifyEmailView();
            }
          } else {
            return const LoginView();
          }
          return const Text("Done");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
