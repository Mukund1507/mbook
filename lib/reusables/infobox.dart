import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({required this.icon, required this.label, required this.text});

  final IconData icon;
  final String label;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            FittedBox(
              child: Text(
                label,
                style: kTextStyle3.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                text,
                style: kTextStyle3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}