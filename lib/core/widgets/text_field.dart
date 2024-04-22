import 'package:flutter/material.dart';

class RoundedCornerTextField extends StatelessWidget {
  const RoundedCornerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Text',
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(10.0),  // Rounded corners
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
