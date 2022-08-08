import 'package:flutter/material.dart';
import 'package:my_notes/consttants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We sent you an email. Please check it and click the link to verify your email address."),
          const Text("If you didn't receive the email, press the utton below."),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('send email verification'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, ((route) => false));
            },
            child: const Text('Restart the verification process'),
          )
        ],
      ),
    );
  }
}
