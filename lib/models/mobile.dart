import 'package:flutter/cupertino.dart';

class Mobile with ChangeNotifier{
  String title;
  String ram;
  int price;
  var isFavorite;
  bool isCamera;
  bool isWifi;
  String cameraSpecs;
  String batterylife;
  String imageURL;
  String id;

  Mobile({
    required this.batterylife,
    required this.isCamera,
    required this.isWifi,
    required this.price,
    required this.ram,
    required this.title,
    this.isFavorite = false,
    required this.imageURL,
    this.cameraSpecs="0.0",
    required this.id

    
  });
  void togglefavorite()
  {
    isFavorite=!isFavorite;
    notifyListeners();
  }
 
}
