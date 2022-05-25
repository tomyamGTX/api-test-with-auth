import 'package:email_and_phone_auth/providers/auth.provider.dart';
import 'package:email_and_phone_auth/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppUser>(builder: (context, user, child) {
      if (user.user != null) {
        return const Home();
      }
      return const Login();
    });
  }
}
