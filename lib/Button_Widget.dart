import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onclicked;
  final Color color;
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onclicked,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
    );
    return TextButton(
      style: flatButtonStyle,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: color,
        ),
      ),
      onPressed: onclicked,
    );
  }
}
