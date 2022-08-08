import 'package:flutter/material.dart';
import 'package:my_notes/consttants/routes.dart';
import 'package:my_notes/firebase_options.dart';
import 'package:my_notes/services/auth/auth_service.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/my_notes.dart';
import 'package:my_notes/views/register_view.dart';
import 'package:my_notes/views/verify_email.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const MyNotes(),
      verifyEmailRoute: (context) => const VerifyEmail(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const MyNotes();
              } else {
                return const VerifyEmail();
              }
            } else {
              return const LoginView();
            }

          default:
            return const Text('Loading....');
        }
      },
    );
  }
}
