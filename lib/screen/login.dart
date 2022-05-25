import 'package:email_and_phone_auth/providers/auth.provider.dart';
import 'package:email_and_phone_auth/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(label: Text('email')),
            ),
            TextField(
              controller: _pass,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
                    Provider.of<AppUser>(context, listen: false)
                        .signIn(email: _email.text, password: _pass.text);
                  }
                },
                child: const Text('Login')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                child: const Text('Register'))
          ],
        ),
      ),
    ));
  }
}
