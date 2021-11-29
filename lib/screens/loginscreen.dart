import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../reusables/roundedtextbutton.dart';
import '../screens/registrationscreen.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String userName;
  late String password;
  FirebaseAuth auth = FirebaseAuth.instance;
  late User user;

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              text: 'Login',
              textStyle: kTextStyle3,
              color: Theme.of(context).primaryColor,
              onPress: () async {
                try {
                  await auth.signInWithEmailAndPassword(
                      email: userName + '@gmail.com', password: password);
                  //user = auth.currentUser!;
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return HomeScreen(userName);
                    }),
                  );
                } catch (e) {
                  print(e);
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedTextButton(
              text: 'Don\'t have an account',
              textStyle: kTextStyle2,
              color: Theme.of(context).secondaryHeaderColor,
              onPress: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return const RegistrationScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
