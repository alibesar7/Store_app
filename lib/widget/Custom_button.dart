import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({   this.onTap, required this.text});
  VoidCallback? onTap;
  String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 20,color: Colors.white)),
        ),
      ),
    );
  }
}