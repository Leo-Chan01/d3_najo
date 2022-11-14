import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class DNFormField extends StatelessWidget {
  const DNFormField({
    Key? key,
    this.emailType = false,
    required this.hint,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final bool emailType;
  final String title;
  final TextEditingController controller;
  final String hint;

  String _capitalize(String str) => str[0].toUpperCase() + str.substring(1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(hint,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: kPrimaryColor)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  // enabledBorder: ,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 18.0),
                  hintText: title
                      .split(' ')
                      .map((word) => _capitalize(word))
                      .join(' ')),
              validator: emailType
                  ? (value) => value!.isEmpty || !EmailValidator.validate(value)
                      ? 'Please enter a valid email address'
                      : null
                  : (value) => value!.isEmpty
                      ? 'Please enter your ${title.toLowerCase()}'
                      : null),
        ),
      ],
    );
  }
}
