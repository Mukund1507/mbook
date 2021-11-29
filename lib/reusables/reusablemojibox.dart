import 'package:flutter/material.dart';
import 'package:mbook/constants.dart';

class ReusableEmojiBox extends StatelessWidget {
  const ReusableEmojiBox({required this.emoji, required this.text});
  final String emoji;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              emoji,
              style: kTextStyle3.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: kTextStyle3.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}