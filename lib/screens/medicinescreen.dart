import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socio/widgets/medicineblock.dart';
import '../model/medicine.dart';
import 'package:provider/provider.dart';
import '../model/medicines.dart';

class MedicinesScreen extends StatefulWidget {
  @override
  _MedicinesScreenState createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  var _isInit = true;
  var _isLoading = false;
  Future<void> _refreshMedicines(BuildContext context) async {
    await Provider.of<Medicines>(context,listen: false).fetchMedicines();
  }
  List<Medicine> med;
  // void initState(){
  //   Future.delayed(Duration.zero).then((_) {
  //  Provider.of<Medicines>(context,listen: false).fetch();
  //   });
  //   super.initState();
  // }
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Medicines>(context).fetchMedicines().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final medicinedata = Provider.of<Medicines>(context);
    final medicines = medicinedata.items;

    return Scaffold(
        appBar: AppBar(
          title: Text('Medicine Tracker'),
          centerTitle: true,
        ),
        body: _isLoading? Center(child: CircularProgressIndicator()): RefreshIndicator(
          onRefresh:()=> _refreshMedicines(context),
          child:ListView(padding: EdgeInsets.all(10),
            children: medicines.map((e) {return MedicineBlock(name: e.name,url: e.url,description: e.description,type: e.type,afterfood: e.afterfood,amount: e.amount,howManyWeeks: e.howManyWeeks ,medicineForm: e.medicineForm,time: e.time,);}).toList(),
          ),
        ));
  }
}
// GridView.count(
// mainAxisSpacing: 15,
// padding: EdgeInsets.all(20),
// childAspectRatio: 5 / 3,
// crossAxisCount: 1,
// children: medicines
//     .map((e) => GridTile(
// child: Image.network(
// e.url,
// fit: BoxFit.fill,
// )))
// .toList())