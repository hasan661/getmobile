class Mobile {
  String title;
  String ram;
  int price;
  bool isFavorite;
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
}
