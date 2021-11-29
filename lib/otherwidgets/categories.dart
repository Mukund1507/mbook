import 'package:flutter/material.dart';
import 'package:mbook/constants.dart';
import '../reusables/reusablemojibox.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: kTextStyle3.copyWith(
              fontSize: 15,
            ),),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ReusableEmojiBox(emoji: '😍', text: 'Romance'),
              ReusableEmojiBox(emoji: '😁', text: 'Comedy'),
              ReusableEmojiBox(
                emoji: '😱',
                text: 'Horror',
              ),
              ReusableEmojiBox(
                emoji: '😚',
                text: 'Drama',
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Showing this month',
            style: kTextStyle3.copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
