import 'package:carousel_slider/carousel_slider.dart';
import 'package:dnajo_homes/models/car_list_data.dart';
import 'package:dnajo_homes/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AutomobilesPage extends StatefulWidget {
  const AutomobilesPage({super.key});

  @override
  State<AutomobilesPage> createState() => _AutomobilesPageState();
}

class _AutomobilesPageState extends State<AutomobilesPage> {
  var formatter = NumberFormat("###,###.0#", "en_US");
  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("DNajo Auto"),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 28,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: CarouselSlider.builder(
                    itemCount: CarListData.carList.length,
                    itemBuilder: ((context, index, realIndex) {
                      return Container(
                        margin: const EdgeInsets.only(left: 4.0, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                CarListData.carList[index].imageUrl.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32, right: 32, bottom: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          CarListData.carList[index].carName
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor,
                                              shadows: [
                                                Shadow(color: Colors.white)
                                              ]),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_pin,
                                              size: 16,
                                              color: kPrimaryColor,
                                            ),
                                            addTextStroke(
                                                mainText: CarListData
                                                    .carList[index].location
                                                    .toString())
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  addTextStroke(
                                      mainText:
                                          "USD ${formatter.format(CarListData.carList[index].price)}")
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        padEnds: true,
                        height: 210)),
              ),
              const SizedBox(height: 44),
              const Text(
                "Recommended Cars for you",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                margin:
                    const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      mainAxisExtent: appHeight * 0.3),
                  itemCount: CarListData.carList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        child: Column(
                          children: [
                            Container(
                              height: (appWidth * 0.4) * 0.7,
                              width: appWidth * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    CarListData.carList[index].imageUrl
                                        .toString(),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Text(
                                CarListData.carList[index].carName.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text("Luxury Car"),
                            const SizedBox(height: 8),
                            Text(
                              "USD ${formatter.format(CarListData.carList[index].price)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 44,
                              width: appWidth * 0.4,
                              child: MaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.black,
                                textColor: Colors.white,
                                child: const Text("Buy Item"),
                              ),
                            )
                          ],
                        ),
                        height: appHeight * 0.3);
                  },
                ),
              )
            ],
          ),
        )));
  }

  Stack addTextStroke({String mainText = ''}) {
    return Stack(children: [
      Text(
        mainText,
        style: TextStyle(
          fontSize: 16,
          foreground: Paint()
            ..strokeWidth = 0.5
            ..color = Colors.white
            ..style = PaintingStyle.stroke,
        ),
      ),
      Text(
        mainText,
        style: const TextStyle(fontSize: 16, color: kPrimaryColor),
      ),
    ]);
  }
}
