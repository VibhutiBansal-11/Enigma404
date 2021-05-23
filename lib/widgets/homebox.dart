import 'package:flutter/material.dart';
class HomeBox extends StatelessWidget{
final String title;
final String imagepath;
final String route;
HomeBox({this.imagepath,this.title,this.route});
@override
  Widget build(BuildContext context) {
  return GestureDetector(onTap: (){
    Navigator.of(context).pushNamed(route);
  },
    child:ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Card(elevation:40 ,borderOnForeground: true,shadowColor: Colors.black,
        child: GridTile(
          child:
          Image.asset(imagepath,fit: BoxFit.fill,),
          footer: GridTileBar(backgroundColor: Colors.blueGrey[500],
            title: Text(title,style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold, ),),
          ),
        ),
      ),
    ),
  );
  }
}