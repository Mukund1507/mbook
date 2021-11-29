import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({required this.onChange, required this.onSubmit});
  final onChange;
  final onSubmit;
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
    return TextField(
      onChanged: onChange,
      onSubmitted: onSubmit,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.search_rounded,
          color: Colors.white,
        ),
        hintText: 'search',
        hintStyle: const TextStyle(
          color: Colors.white70,
        ),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
