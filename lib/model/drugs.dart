import 'package:flutter/material.dart';
import 'drug.dart';
import 'package:http/http.dart' as http;
import 'package:socio/model/drug.dart';
import 'dart:convert' show json;
class Drugs with ChangeNotifier {
  List<Drug> _drug = [];
  List<Drug> get items {
    return [..._drug];
  }



  Future<void> fetchDrugbyName(int option,String name) async {
    String id;
    List urls = [
      'http://www.healthos.co/api/v1/search/medicines/brands/$name' //name,
          ,
      'http://www.healthos.co/api/v1/search/medicines/generics/$name'
    ];
 var headers = {
      'Authorization': 'Bearer 698faf99010cdff627b0db4865be729f5d8b7c2b39ee0900cb0196f06d4b9e78'
    };

    if(option==2){
print('Running option =2');
     var request = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/search/medicines/brands/$name'));
     request.body = '''''';
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200) {
       final res = await response.stream.bytesToString();

       List<Drug> loadedDrug = vib(json.decode(res));
        print(loadedDrug[0].medicineId);
       id=  loadedDrug[0].medicineId;

     }
     else {
       print(response.reasonPhrase);
     }
     var request1 = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/medicines/brands/$id/alternatives?page=1&size=10'));
     request1.body = '''''';
     request1.headers.addAll(headers);
     http.StreamedResponse response1 = await request1.send();
     if (response1.statusCode == 200) {
       final res1 = await response1.stream.bytesToString();
       print("response"+res1);
       List<Drug> loadedDrug1 = vib(json.decode(res1));
     //  List<Drug> loadedDrug1 = vib(json.decode('[{"name":"CLOBENATE 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":10.0,"size":"15 GM cream","manufacturer":"Ind Swift Laboratories Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"4GQ43z"},{"name":"KLOSOFT 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":22.0,"size":"15 GM cream","manufacturer":"Novartis India Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"4IIG33"},{"name":"CVATE 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":46.12,"size":"30 GM cream","manufacturer":"Omega Remedies Pvt Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"44w1wz"}]'));

       _drug = loadedDrug1 ;


     }
     else {
       print(response.reasonPhrase);
     }


   }
   else{
     var request = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/search/medicines/brands/$name'));
     request.body = '''''';
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200) {
       final res = await response.stream.bytesToString();
       print(res);
     //  List<Drug> loadedDrug = vib(json.decode(res));
         List<Drug> loadedDrug = vib(json.decode('[{"name":"CLOBENATE 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":10.0,"size":"15 GM cream","manufacturer":"Ind Swift Laboratories Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"4GQ43z"},{"name":"KLOSOFT 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":22.0,"size":"15 GM cream","manufacturer":"Novartis India Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"4IIG33"},{"name":"CVATE 0.05% CREAM","form":"GM of cream","standardUnits":1,"packageForm":"tube","price":46.12,"size":"30 GM cream","manufacturer":"Omega Remedies Pvt Ltd","constituents":[{"name":"Clobetasol Topical","strength":"0.05%"}],"schedule":{"category":"OTC","label":"It can be sold without a prescription"},"medicine_id":"44w1wz"}]'));
       _drug = loadedDrug ;


     }
     else {
       print(response.reasonPhrase);
     }
   }
    notifyListeners();

  }

}
// Future<void> fetchAlternateDrug() async {
//   var headers = {
//     'Authorization': 'Bearer 46bb7528a6ac8f40e673e3e0163c8331d1ad2ea806a4311bfc7a56d0b7047029'
//   };
//   var request = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/medicines/brands/586ab30c91c126fe056dc97d/alternatives?page=1&size=10'));
//   request.body = '''''';
//   request.headers.addAll(headers);
//   http.StreamedResponse response = await request.send();
//   if (response.statusCode == 200) {
//     final res = await response.stream.bytesToString();
//     print(res);
//     List<Drug> loadedDrug = vib(json.decode(res));
//     _drugAlternate = loadedDrug ;
//     print('name'+loadedDrug[0].name);
//
//   }
//   else {
//     print(response.reasonPhrase);
//   }
//   notifyListeners();
//
// }