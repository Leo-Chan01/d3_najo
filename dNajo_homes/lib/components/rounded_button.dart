import 'package:flutter/material.dart';

import '/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  final EdgeInsets? padding;
  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = kPrimaryColor,
    this.padding,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        backgroundColor: color,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
        textStyle: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
