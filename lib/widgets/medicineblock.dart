import 'package:flutter/material.dart';

class MedicineBlock extends StatelessWidget{

  final String name;
  final int amount;
  final String type;
  final int howManyWeeks;
  final String medicineForm;
  final int time;
final String description;
  final bool afterfood;
  final String url;
  MedicineBlock({this.url,this.name,this.afterfood,this.time,this.amount,this.howManyWeeks,this.medicineForm,this.type,this.description});
  @override
  Widget build(BuildContext context) {


    return Card(elevation:10,
      child: Container(height: 260,padding: EdgeInsets.all(10),
      child: Row(children: [
        SizedBox(width: 10,),
        Container(width: 130,height: 230,
            child: Image.network(url,fit: BoxFit.fill,)),
        SizedBox(width: 10,),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(name.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Type ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: type,style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Amount ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: '$amount',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'No. of weeks ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: '$howManyWeeks',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Medicine Form ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: '$medicineForm',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'When ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: afterfood? 'After Food': 'Before Food',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Description ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    TextSpan(text: description,style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
          ],),
        )
      ],)),
    );
  }
}