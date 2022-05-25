import 'package:email_and_phone_auth/providers/auth.provider.dart';
import 'package:email_and_phone_auth/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              decoration: InputDecoration(label: Text('email')),
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(label: Text('Password')),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
                    Provider.of<AppUser>(context, listen: false).signUp(
                      email: _email.text,
                      password: _pass.text,
                    );
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                },
                child: const Text('Register'))
          ],
        ),
      ),
    ));
  }
}
