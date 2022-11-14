import 'package:flutter/material.dart';
// import '../theme.dart';

class DNPasswordFormField extends StatefulWidget {
  const DNPasswordFormField(
      {Key? key, required this.create, required this.controller})
      : super(key: key);
  final bool create;
  final TextEditingController controller;

  @override
  _DNPasswordFormFieldState createState() => _DNPasswordFormFieldState();
}

class _DNPasswordFormFieldState extends State<DNPasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text('Password',
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodyText2
        //         ?.copyWith(color: kPrimaryMain)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 18.0),
                  hintText: widget.create ? 'Create password' : 'Password',
                  suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      icon: Icon(_obscurePassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off))),
              obscureText: _obscurePassword,
              validator: (value) => value!.isEmpty || value.length < 6
                  ? 'At least 6 characters password'
                  : null),
        ),
      ],
    );
  }
}
