import 'package:flutter/material.dart';
import 'package:mbook/constants.dart';

class TheatreTab extends StatelessWidget {
  const TheatreTab(
      {required this.name, required this.address, required this.id, required this.onPress});

  final String name;
  final String address;
  final String id;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: kTextStyle1,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              address,
              style: kTextStyle3.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              id,
              style: kTextStyle3.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}