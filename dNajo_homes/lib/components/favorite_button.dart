import 'package:flutter/material.dart';

import '/utils/constants.dart';

class FavoriteButton extends StatelessWidget {
  final AnimationController? animationController;
  const FavoriteButton({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.width / 1.2) - 59,
      right: 38,
      child: ScaleTransition(
        alignment: Alignment.center,
        scale: CurvedAnimation(
          parent: animationController!,
          curve: Curves.fastOutSlowIn,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(32),
          elevation: 6,
          child: const CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 32,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ),
    );
  }
}
