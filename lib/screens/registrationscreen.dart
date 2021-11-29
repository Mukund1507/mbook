import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../reusables/roundedtextbutton.dart';
import 'homescreen.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String userName;
  late String password;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder roundBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {},
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white70,
                ),
                iconSize: 40,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Create an account',
                style: kTextStyle1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  userName = value;
                },
                style: kTextStyle2,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: kTextStyle2,
                  enabledBorder: roundBorder,
                  focusedBorder: roundBorder,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                style: kTextStyle2,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: kTextStyle2,
                  enabledBorder: roundBorder,
                  focusedBorder: roundBorder,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundedTextButton(
                text: 'Create an Account',
                textStyle: kTextStyle3,
                color: Theme.of(context).primaryColor,
                onPress: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                        email: userName + '@gmail.com', password: password);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return HomeScreen(userName);
                      }),
                    );
                  }catch (e){
                    print(e);
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedTextButton(
                text: 'Already have an account',
                textStyle: kTextStyle2,
                color: Theme.of(context).secondaryHeaderColor,
                onPress: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return const LoginScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
