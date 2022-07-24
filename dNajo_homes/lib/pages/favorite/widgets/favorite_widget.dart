import 'package:flutter/material.dart';
import 'package:real_estate/pages/home/estate_detail_page.dart';

import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    Key? key,
  }) : super(key: key);
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  List<EstateListData> estateList = EstateListData.estateList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
        itemCount: estateList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          crossAxisSpacing: size.width * 0.03,
          mainAxisSpacing: size.height * 0.03,
        ),
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return myGridItems(
              gridImage: estateList[index].imageUrl,
              duration: estateList[index].subTxt,
              gridName: estateList[index].titleTxt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EstateDetailsPage(
                        estateData: estateList[index],
                      );
                    },
                  ),
                );
              });
        });
  }

  Widget myGridItems({
    required String? gridName,
    required String? gridImage,
    required String? duration,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        gridImage!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 9,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.favorite),
                    iconSize: 24,
                    color: kPrimaryColor.withOpacity(0.7),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gridName!,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    duration!,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
