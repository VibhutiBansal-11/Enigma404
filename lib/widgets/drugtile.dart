import 'package:flutter/material.dart';

class DrugTile extends StatelessWidget {
  final String name;
  final String form;
  final int standardUnits;
  final String packageForm;
  final double price;
  final String size;
  final String manufacturer;

  DrugTile({
    this.name,
    this.form,
    this.standardUnits,
    this.packageForm,
    this.price,
    this.size,
    this.manufacturer,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(elevation: 10,
        child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(children: [
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('FORM : ' + form), Text('SIZE : ' + size)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('PKG FORM : ' + packageForm),
                  Text('STANDARD UNIT : ' + '$standardUnits')
                ],
              ),
              Row(children: [
                SizedBox(
                  width: 40,
                ),
                Text('MANUFACTURER : ' + manufacturer
                    )
              ]),  Row(children: [
                SizedBox(
                  width: 40,
                ),
                Text('PRICE : ' + 'Rs.$price',
                    )
              ]),
SizedBox(height: 10,)

            ],
          ),
        ),
      ),
    );
  }
}
