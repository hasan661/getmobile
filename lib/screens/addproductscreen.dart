import 'package:flutter/material.dart';
import 'package:getmobile/models/mobile.dart';
import 'package:getmobile/models/mobile_detail.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

// ignore: must_be_immutable
class AddProduct extends StatefulWidget {
  static const routeName = "/add=products";

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final cameracontroller = TextEditingController();
  final imageURLcontroller = TextEditingController();
  final cameraavaliablefocus = FocusNode();
  final imageurlfocus = FocusNode();
  var isInit = true;

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    cameraavaliablefocus.addListener(() {
      _updatecamera(cameraavaliablefocus);
    });
    imageurlfocus.addListener(() {
      _updatecamera(imageurlfocus);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final id = ModalRoute.of(context)!.settings.arguments;
    print(id);
    if (isInit) {
      if (id != null) {
        final mobilebyid=Provider.of<MobileDetail>(context, listen: false).filterbyid(id);
        
        initvalues = {
          "title": mobilebyid.title,
          "ram": mobilebyid.ram,
          "price": mobilebyid.price,
          "isCamera": mobilebyid.isCamera,
          "CameraSpecs": mobilebyid.cameraSpecs,
          "isWifi": mobilebyid.isWifi,
          "batterylife": mobilebyid.batterylife,
          
          
        };
        imageURLcontroller.text=mobilebyid.imageURL;
        cameracontroller.text=mobilebyid.isCamera.toString();
        _editedmobile.id=id.toString();
      }
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cameracontroller.removeListener(() {
      _updatecamera(cameraavaliablefocus);
    });
    imageurlfocus.dispose();

    cameracontroller.dispose();
    imageURLcontroller.dispose();
    cameraavaliablefocus.dispose();

    super.dispose();
  }

  void _updatecamera(var focus) {
    if (!focus.hasFocus) {
      print(cameracontroller.text + "hasan");
      setState(() {});
    } else {
      return;
    }
  }

  var initvalues = {
    "title": "",
    "ram": "",
    "price": 0,
    "isCamera": "",
    "CameraSpecs": "",
    "isWifi": "",
    "batterylife": "",
    "id":""
  };

  var _editedmobile = Mobile(
      batterylife: "",
      isCamera: true,
      isWifi: true,
      price: 0,
      ram: "",
      title: "",
      imageURL: "",
      id: "",
      cameraSpecs: "");

  final List<Map<String, dynamic>> _items = [
    {
      'value': true,
      'label': 'True',
      'icon': Icon(Icons.check),
    },
    {
      'value': false,
      'label': 'False',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context);
    void _saveform() {
      final isvalid = key.currentState!.validate();
      if (isvalid) {
        key.currentState!.save();
        // print(_editedmobile.id+"HasanQasim");
        if(_editedmobile.id!=""){
          print("hasan");
          mobileData.updatemobile(_editedmobile.id, _editedmobile);

        }
        else{
          print("Qasim");
        mobileData.addmobile(_editedmobile);
        }
      } else {
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Or Edit Your Mobile"),
        actions: [
          IconButton(
              onPressed: () {
                _saveform();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: initvalues['title'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: _editedmobile.batterylife,
                        isCamera: _editedmobile.isCamera,
                        isWifi: _editedmobile.isWifi,
                        price: _editedmobile.price,
                        ram: _editedmobile.ram,
                        title: val.toString(),
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                  ),
                  TextFormField(
                    initialValue: initvalues['ram'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      } 
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Ram",
                    ),
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: _editedmobile.batterylife,
                        isCamera: _editedmobile.isCamera,
                        isWifi: _editedmobile.isWifi,
                        price: _editedmobile.price,
                        ram: val.toString(),
                        title: _editedmobile.title,
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                  ),
                  TextFormField(
                    initialValue: initvalues['price'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      } else if (int.tryParse(val!) == null) {
                        return "Please Provide A Numeric Value";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Price",
                    ),
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: _editedmobile.batterylife,
                        isCamera: _editedmobile.isCamera,
                        isWifi: _editedmobile.isWifi,
                        price: int.parse(val.toString()),
                        ram: _editedmobile.ram,
                        title: _editedmobile.title,
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                  ),
                  SelectFormField(
                    // initialValue: initvalues['isCamera'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      }
                      return null;
                    },
                    type: SelectFormFieldType.dropdown,
                    decoration: InputDecoration(
                      labelText: "Camera Availaible",
                    ),
                    focusNode: cameraavaliablefocus,
                    items: _items,
                    controller: cameracontroller,
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: _editedmobile.batterylife,
                        isCamera: val!.toLowerCase() == "true",
                        isWifi: _editedmobile.isWifi,
                        price: _editedmobile.price,
                        ram: _editedmobile.ram,
                        title: _editedmobile.title,
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                  ),
                  if (cameracontroller.text == "true")
                    TextFormField(
                      initialValue: initvalues['CameraSpecs'].toString(),
                      validator: (val) {
                        if (val == "") {
                          return "Please Provide A Value";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Camera Specs",
                      ),
                      onSaved: (val) {
                        _editedmobile = Mobile(
                            batterylife: _editedmobile.batterylife,
                            isCamera: _editedmobile.isCamera,
                            isWifi: _editedmobile.isWifi,
                            price: _editedmobile.price,
                            ram: _editedmobile.ram,
                            title: _editedmobile.title,
                            imageURL: _editedmobile.imageURL,
                            id: _editedmobile.id.toString(),
                            cameraSpecs: val.toString());
                      },
                    ),
                  SelectFormField(
                    initialValue: initvalues['isWifi'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      }

                      return null;
                    },
                    type: SelectFormFieldType.dropdown,
                    decoration: InputDecoration(
                      labelText: "Wifi Availaible",
                    ),
                    items: _items,
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: _editedmobile.batterylife,
                        isCamera: _editedmobile.isWifi,
                        isWifi: _editedmobile.isWifi,
                        price: _editedmobile.price,
                        ram: _editedmobile.ram,
                        title: _editedmobile.title,
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                    // controller: cameracontroller,
                  ),
                  TextFormField(
                    initialValue: initvalues['batterylife'].toString(),
                    validator: (val) {
                      if (val == "") {
                        return "Please Provide A Value";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Battery Life",
                    ),
                    onSaved: (val) {
                      _editedmobile = Mobile(
                        batterylife: val.toString(),
                        isCamera: _editedmobile.isCamera,
                        isWifi: _editedmobile.isWifi,
                        price: _editedmobile.price,
                        ram: _editedmobile.ram,
                        title: _editedmobile.title,
                        imageURL: _editedmobile.imageURL,
                        id: _editedmobile.id.toString(),
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Image.network(imageURLcontroller.text),
                        width: 100,
                        height: 100,
                      ),
                      Expanded(
                        child: TextFormField(
                          // initialValue: initvalues['imageURL'].toString(),
                          validator: (val) {
                            if (val == "") {
                              return "Please Provide A Value";
                            }

                            return null;
                          },
                          controller: imageURLcontroller,
                          focusNode: imageurlfocus,
                          decoration: InputDecoration(
                            labelText: "ImageURL",
                          ),
                          onSaved: (val) {
                            _editedmobile = Mobile(
                              batterylife: _editedmobile.batterylife,
                              isCamera: _editedmobile.isCamera,
                              isWifi: _editedmobile.isWifi,
                              price: _editedmobile.price,
                              ram: _editedmobile.ram,
                              title: _editedmobile.title,
                              imageURL: val.toString(),
                              id: _editedmobile.id.toString(),
                            );
                          },
                          onFieldSubmitted: (_) {
                            _saveform();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
