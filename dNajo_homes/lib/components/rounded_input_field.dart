import 'package:flutter/material.dart';

import '/components/text_field_container.dart';
import '/utils/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      this.textInputType,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: textInputType ?? TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
