import 'package:flutter/material.dart';




class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Vibhuti Bansal',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
              accountEmail: Text('bansal.vibhuti25@gmail.com',style: TextStyle(color: Colors.white,fontSize: 16)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/IMG-20191231-WA0148.jpg'),
              ),



              onDetailsPressed: (){},


              decoration: BoxDecoration(color: Colors.blueGrey[500],
                  // image: DecorationImage(
                  //     image: AssetImage("assets/cover.jpg", ),
                  //     fit: BoxFit.fill)
              ),),

            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onLongPress: (){},
            ),


            Divider(),







            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onLongPress: (){},
            ),

            Divider(),

            ListTile(
              title: Text('Support'),
              leading: Icon(Icons.report_problem),
              onLongPress: (){},
            ),

            Divider(),
            ListTile(
                title: Text('Close'),
                leading: Icon(Icons.close),
                onTap: (){
                  Navigator.of(context).pop();}
            ),
          ]
      ),
    );

  }

}