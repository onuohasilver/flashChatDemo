import 'package:flutter/material.dart';
import 'package:flash_chat/components/button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kIextFieldDecoration.copyWith(hintText: 'Enter Email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kIextFieldDecoration.copyWith(hintText: 'Enter Password')),
            SizedBox(
              height: 24.0,
            ),
            Button(
                color: Colors.lightBlueAccent,
                label: 'Register',
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                })
          ],
        ),
      ),
    );
  }
}
