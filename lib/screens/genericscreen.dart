import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:socio/model/generics.dart';
import 'package:socio/widgets/drugtile.dart';
import '../model/medicine.dart';
import 'package:provider/provider.dart';

class GenericScreen extends StatefulWidget {
  @override
  _GenericScreenState createState() => _GenericScreenState();
}

class _GenericScreenState extends State<GenericScreen> {
  final TextEditingController controller = TextEditingController();
  var _isInit = true;
  var _isLoading = false;


  Future<void> _refreshMedicines(BuildContext context) async {
    await Provider.of<Generics>(context,listen: false).fetchGenericbyName(controller.text);
  }
  List<Medicine> med;
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Generics>(context).fetchGenericbyName(controller.text).then((_) {
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
    final drugData = Provider.of<Generics>(context);
    final drugs = drugData.drugbygenericlist;

    return Scaffold(
        appBar: AppBar(
          title: Text('Generic Med Alternatives'),
          centerTitle: true,
        ),
        body: _isLoading? Center(child: CircularProgressIndicator()): RefreshIndicator(
            onRefresh:()=> _refreshMedicines(context),
            child:  Column(
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

                    IconButton(icon: Icon(Icons.search),onPressed:()=>_refreshMedicines(context))

                  ],
                ),
                Expanded(
                  child: ListView(
                      children: drugs.map((e)  {
                        return DrugTile(name: e.name,form: e.form,manufacturer: e.manufacturer,packageForm: e.packageForm,price: e.price,size: e.size,standardUnits: e.standardUnits,);
                      }).toList()
                  ),
                )
              ],
            )
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