import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/favorite_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Favorite',
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            FontAwesomeIcons.mapMarkerAlt,
            color: Colors.white,
            size: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
      body: const FavoriteWidget(),
    );
  }
}
