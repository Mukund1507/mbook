import 'package:flutter/material.dart';

class PosterBox extends StatelessWidget {
  const PosterBox({required this.imageString, required this.onPress});

  final String imageString;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageString),
          ),
        ),
      ),
    );
  }
}
