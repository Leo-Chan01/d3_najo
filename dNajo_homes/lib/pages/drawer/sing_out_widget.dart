import 'package:dnajo_homes/pages/authentication/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
              onTapped(context);
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  Future<void> onTapped(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      PersistentNavBarNavigator.pushNewScreen(context,
          screen: const LoginPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino);
    });
  }
}
