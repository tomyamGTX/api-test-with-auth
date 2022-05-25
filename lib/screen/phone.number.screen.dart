import 'package:email_and_phone_auth/providers/auth.provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _phone,
                decoration:
                    const InputDecoration(label: Text('Insert Phone Number')),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_phone.text.isNotEmpty) {
                      getOtp(_phone.text, '123456');
                    }
                  },
                  child: const Text('Get Code'))
            ],
          ),
        ));
  }

  Future<void> getOtp(String text, String code) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: text,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = code;

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await AppUser.instance.user!.updatePhoneNumber(credential);
        Navigator.pop(context);
        print("success b");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
