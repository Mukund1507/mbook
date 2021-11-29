import 'package:flutter/material.dart';
import 'package:mbook/constants.dart';

class TopGreeting extends StatelessWidget {
  const TopGreeting({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome $name 👋',
              style: kTextStyle2,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Let\'s relax and watch a movie!',
              style: kTextStyle3
            ),
          ],
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg'),
        ),
      ],
    );
  }
}