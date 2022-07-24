import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '/pages/profile/profile_page.dart';
import '/utils/constants.dart';

class DrawerHeaderr extends StatelessWidget {
  final AnimationController? anIconAnimationController;
  const DrawerHeaderr({
    Key? key,
    required this.anIconAnimationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 58, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: anIconAnimationController!,
            builder: (BuildContext context, Widget? child) {
              return ScaleTransition(
                scale: AlwaysStoppedAnimation<double>(
                    1 - (anIconAnimationController!.value) * 0.2),
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation<double>(
                      Tween<double>(begin: 0, end: 24)
                              .animate(CurvedAnimation(
                                  parent: anIconAnimationController!,
                                  curve: Curves.fastOutSlowIn))
                              .value /
                          360),
                  child: AvatarGlow(
                    endRadius: 55,
                    repeat: true,
                    showTwoGlows: true,
                    glowColor: kSecondaryColor,
                    child: InkWell(
                      child: const CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(
                          'assets/images/tamara-bellis.jpg',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfilePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            child: Text(
              'Dj Simon',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          const Text(
            'DJ_Simon@Example.com',
            style: kSubTextStyle,
          ),
        ],
      ),
    );
  }
}
