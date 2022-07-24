import 'package:flutter/material.dart';

class SingOutWidget extends StatelessWidget {
  const SingOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListTile(
            title: const Text(
              'Sign Out',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black54,
              ),
              textAlign: TextAlign.left,
            ),
            trailing: const Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            onTap: () {
              onTapped();
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  void onTapped() {
    // print('Doing Something...');
  }
}
