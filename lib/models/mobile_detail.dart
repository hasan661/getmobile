import 'package:flutter/cupertino.dart';
import 'mobile.dart';

class MobileDetail with ChangeNotifier {
  List _mobiles_list = [
    Mobile(
      batterylife: "4310 mAh ",
      isCamera: true,
      isWifi: true,
      price: 60000,
      ram: "8 GB",
      title: "Oppo Reno",
      imageURL: "https://www.whatmobile.com.pk/admin/images/Oppo/OppoReno6-b.jpg",
      cameraSpecs: "64 MP",
      id: "M1",
     
    ),
    Mobile(
      batterylife: "1020 mAh ",
      isCamera: false,
      isWifi: false,
      price: 5000,
      ram: "128 MB",
      title: "Nokia 105",
      imageURL: "https://www.whatmobile.com.pk/admin/images/Nokia/Nokia1054G-b.jpg",
      id: "M2",
      
      
    ),
    Mobile(
      batterylife: "6000 mAh ",
      isCamera: true,
      isWifi: true,
      price: 18000,
      ram: "3 GB",
      title: "Infinix Hot 10",
      imageURL: "https://www.whatmobile.com.pk/admin/images/Infinix/InfinixHot10Play3GB-b.jpg",
      cameraSpecs: "13 MP",
      id: "M3",
     
    ),
    Mobile(
      batterylife: "4400 mAh ",
      isCamera: true,
      isWifi: true,
      price: 300000,
      ram: "12 GB",
      title: "Samsung G Fold",
      imageURL: "https://i.gadgets360cdn.com/products/large/samsung-galaxy-z-fold-3-646x800-1628693757.jpg",
      cameraSpecs: "12 MP",
      id: "M4",
     
    ),
  ];

  List get mobiledetails{
    return [..._mobiles_list];
  }
  List get onlyFavorite{
    return mobiledetails.where((element) => element.isFavorite==true).toList();
  }
  

 
}
