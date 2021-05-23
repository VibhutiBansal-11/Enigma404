import 'package:flutter/material.dart';
import 'package:socio/model/generic.dart';
import 'drug.dart';
import 'package:http/http.dart' as http;
import 'package:socio/model/drug.dart';
import 'dart:convert' show json;
class Generics with ChangeNotifier {
  List<Generic> _generic ;
  List<Generic> get items {
    return [..._generic];
  }
  List<Drug> _drugbygeneric =[];
  List<Drug> get drugbygenericlist{
    return [..._drugbygeneric];
  }

  Future<void> fetchGenericbyName(String name) async {

    var headers = {
      'Authorization': 'Bearer 698faf99010cdff627b0db4865be729f5d8b7c2b39ee0900cb0196f06d4b9e78'
    };

print('run')
;
      var request = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/search/medicines/generics/$name'));
      request.body = '''''';
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final res = await response.stream.bytesToString();
        print(res);
       List<Generic>  loadedgeneric = genericf(json.decode(res));
        _generic = loadedgeneric ;

        var request1 = http.Request('GET', Uri.parse('http://www.healthos.co/api/v1/medicines/generics/${loadedgeneric[0].genericId}/medicines?page=1&size=10&exclusive=false'));
        request1.body = '''''';
        request1.headers.addAll(headers);
        http.StreamedResponse response1 = await request1.send();
        if (response1.statusCode == 200) {
          final res1 = await response1.stream.bytesToString();
          print(res1);
          List<Drug> loadedDrug = vib(json.decode(res1));
          _drugbygeneric = loadedDrug;



      }
      else {
        print(response.reasonPhrase);
      }

    notifyListeners();

  }

}}
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