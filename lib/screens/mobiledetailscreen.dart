import 'package:flutter/material.dart';

import 'package:getmobile/models/mobile_detail.dart';

import 'package:provider/provider.dart';

class MobileDetailScreen extends StatelessWidget {
  static const routeName = "/mobiledetail";
  const MobileDetailScreen({Key? key}) : super(key: key);
  TableRow buildtablerow(String text, String detail) {
    return TableRow(children: [
      Text(
        text,
        textScaleFactor: 1.5,
        // textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        // textAlign: TextAlign.,
      ),
      Text(
        "$detail",
        textScaleFactor: 1.5,
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context).mobiledetails;
    final id = ModalRoute.of(context)!.settings.arguments;
    final _loadedmobiles = mobileData.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${_loadedmobiles.title}",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.network(
                _loadedmobiles.imageURL,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            Container(
              width: 380,
              child: Card(
                  child: Table(
                border: TableBorder.all(width: 1, color: Colors.black),
                children: [
                  buildtablerow("Battery Life", _loadedmobiles.batterylife),
                  buildtablerow(
                      "Camera",
                      (_loadedmobiles.isCamera)
                          ? "Yes, ${_loadedmobiles.cameraSpecs}"
                          : "No"),
                  buildtablerow("Price", "${_loadedmobiles.price}"),
                  buildtablerow("RAM", _loadedmobiles.ram),
                  buildtablerow("WIFI", (_loadedmobiles.isWifi) ? "Yes" : "No")
                ],
              )),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 390,
              // color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
