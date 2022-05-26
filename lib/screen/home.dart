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
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 40,
                      child: CircleAvatar(
                        radius: 38,
                        child: Text(
                          AppUser.instance.user!.email!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: buildTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(child: Text('Welcome ${AppUser.instance.user!.email}')),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Card(
                  child: TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GetApi())),
                    child: const Text('Get Azan Time Api'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () =>
                        Provider.of<AppUser>(context, listen: false).signOut(),
                    child: const Text('Log Out'),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Welcome ${AppUser.instance.user!.email}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Your Phone Number is ${AppUser.instance.user!.phoneNumber}'),
                if (AppUser.instance.user!.phoneNumber == null)
                  const Text('Link Your Phone Number'),
                if (AppUser.instance.user!.phoneNumber == null)
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PhoneNumberScreen())),
                    child: const Text('Go to Phone number screen'),
                  ),
              ],
            ),
          )),
    );
  }

  TextStyle buildTextStyle() => const TextStyle(fontSize: 20);
}
