import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Mybutton({Key? key, required this.label ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 124,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
        ),
        child:Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ) ,
      ),
    );
  }
}