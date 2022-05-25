import 'package:email_and_phone_auth/providers/auth.provider.dart';
import 'package:email_and_phone_auth/screen/phone.number.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'getapi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Link Your Phone Number'),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PhoneNumberScreen())),
            child: const Text('Go to Phone number screen'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetApi())),
            child: const Text('Get Azan Time Api'),
          ),
          TextButton(
            onPressed: () =>
                Provider.of<AppUser>(context, listen: false).signOut(),
            child: const Text('Log Out'),
          )
        ],
      ),
    ));
  }
}
