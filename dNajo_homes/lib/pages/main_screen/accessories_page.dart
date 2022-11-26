import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class AccessoriesPage extends StatefulWidget {
  const AccessoriesPage({super.key});

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {
  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16),
              child: Text(
                "Accessories",
                style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: appHeight * 0.3),
                itemCount: 10,
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
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Louis Vuitton",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text("Exclusives attire for men"),
                          const SizedBox(height: 8),
                          const Text(
                            "NGN 1,000,000.00",
                            style: TextStyle(
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
          ]),
        ),
      ),
    );
  }
}
