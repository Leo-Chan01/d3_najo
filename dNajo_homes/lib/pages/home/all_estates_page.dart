import 'package:flutter/material.dart';

import '/models/estate_list_data.dart';
import '/pages/payment/widgets/check_out_list_item.dart';

class AllEstatesPage extends StatefulWidget {
  const AllEstatesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AllEstatesPage> createState() => _AllEstatesPageState();
}

class _AllEstatesPageState extends State<AllEstatesPage> {
  List<EstateListData> estateList = EstateListData.estateList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'All Estates',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: estateList.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckOutListItem(
            estateData: estateList[index],
          );
        },
      ),
    );
  }
}
