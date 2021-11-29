import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbook/reusables/roundedtextbutton.dart';
import '../constants.dart';
import '../screens/registrationscreen.dart';
import 'loginscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 280,
              child: Image.asset('assets/images/Screenshot (52).png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hey! Welcome',
              style: kTextStyle1,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'We help you pre-book your movie tickets faster and easier',
              style: kTextStyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 45,
            ),
            RoundedTextButton(
              text: 'Get Started',
              color: Theme.of(context).primaryColor,
              textStyle: kTextStyle3,
              onPress: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return const RegistrationScreen();
                  }),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedTextButton(
              text: 'I already have an account',
              color: Theme.of(context).secondaryHeaderColor,
              textStyle: kTextStyle2,
              onPress: () {
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
    );
  }
}
