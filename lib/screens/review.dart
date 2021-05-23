import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReviewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Ratings'),
          centerTitle: true,
        ),
        body:  Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 40,),
                    Expanded(
                      child: TextField(


                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.red.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,

                        ),
                        controller: controller,
                        enableSuggestions: true,

                      ),
                    ),

                    IconButton(icon: Icon(Icons.search),onPressed: null)

                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.87/1,
                      children: [
                      // GridTile(
                      //   child:
                      //   Image.asset('assets/adhd.png',fit: BoxFit.scaleDown,),
                      //   footer: GridTileBar(backgroundColor: Colors.blueGrey[500],
                      //     title: Text('Top 10 Drugs for ADHD',style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold, ),),
                      //   ),
                      // )
                        GridTile(
                          child:
                          Image.asset('assets/ybeld.png',fit: BoxFit.scaleDown,),
                          footer: GridTileBar(backgroundColor: Colors.blueGrey[500],
                            title: Text('Sentiments for Lybrel',style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold, ),),
                          ),
                        ),
                        GridTile(
                          child:
                          Image.asset('assets/download.png',fit: BoxFit.scaleDown),
                          footer: GridTileBar(backgroundColor: Colors.blueGrey[500],
                            title: Text('Number of users who found Lybrel useful',style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold, ),),
                          ),
                        ),
                        GridTile(
                          child:
                          Image.asset('assets/r.png',fit: BoxFit.scaleDown,),
                          footer: GridTileBar(backgroundColor: Colors.blueGrey[500],
                            title: Text('User Rating for Lybrel',style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold, ),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        );
  }
}