import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socio/widgets/drawer.dart';
import 'package:socio/widgets/homebox.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer:DrawerMenu(),
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.redAccent,

        title: Text(
          'INIGMA',style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(margin: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.87/1,
          children: [
            HomeBox(title: 'Medicine Alternatives', imagepath: 'assets/Pharmacist-amico.png',route: 'drug',),
            HomeBox(title: 'Generic Alternatives', imagepath: 'assets/generic.png',route: 'generic'),
            HomeBox(title: 'Drug Review Analysis', imagepath: 'assets/review.png',route: 'review',),
            HomeBox(title: 'Rating', imagepath: 'assets/rating.png',route: 'review',),

            HomeBox(title: 'Medicine Tracker', imagepath: 'assets/Medicine-cuate.png',route: 'medicines',),
            HomeBox(title: 'Timeline', imagepath: 'assets/Timeline-amico.png',route:'timeline'),
            HomeBox(title: 'Calendar', imagepath: 'assets/Calendar-amico.png',route: 'calendar',),
            HomeBox(title: 'QR Code', imagepath: 'assets/Security On-rafiki.png',route: 'qrcode',),





          ],
        ),
      ),
    );
  }
}
