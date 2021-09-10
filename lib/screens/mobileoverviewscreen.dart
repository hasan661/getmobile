import 'package:flutter/material.dart';
import 'package:getmobile/screens/mobiledetailscreen.dart';
import 'package:provider/provider.dart';
import '../providers/mobile_detail.dart';

class MobileOverviewScreen extends StatelessWidget {
  const MobileOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobileData = Provider.of<MobileDetail>(context).mobiledetails;

    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              "Get-Mobile",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, index) {
            return GestureDetector(
               onTap: () {
            Navigator.of(context).pushNamed(MobileDetailScreen.routeName, arguments: mobileData[index].id);
          },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: GridTile(
                  child: Card(
                      child: Image.network(
                    mobileData[index].imageURL,
                    height: 300,
                    width: 200,
                  )),
                  footer: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    child: Container(
                      width: 200,
                      child: GridTileBar(
                        backgroundColor: Colors.black87,
                        title: Column(
                          children: [
                            Text(
                              mobileData[index].title,
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${mobileData[index].price} Rs",
                              style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: mobileData.length,
        ));
  }
}
