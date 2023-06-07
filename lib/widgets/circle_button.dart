import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  const CircleButton({Key? key, required this.icon, required this.onPressed}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF73AFF9),
      ),
      child: Icon(icon,
      color: Colors.white,
      ),
    );
  }
}