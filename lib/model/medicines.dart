import 'package:flutter/material.dart';
import 'medicine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:intl/intl.dart';
import '../model/drug.dart';
class Medicines with ChangeNotifier {
  List<Medicine> _medicines = [];

  List<Medicine> get items {
    return [..._medicines];
  }

  void addmedicine() {
    notifyListeners();
  }

  Future<void> fetchMedicines() async {

    const url = 'https://inigma-5744a-default-rtdb.firebaseio.com/medicines.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Medicine> loadedMedicine = [];
      extractedData.forEach((prodId, prodData) {
        print(prodData);
        print(prodId.runtimeType);
       loadedMedicine.add(Medicine(
        id: prodId,
             description: prodData['description'],
             type: prodData['type'],
             time: prodData['time'],
             notifyId: prodData['notifyId'],
             name: prodData['name'],
             medicineForm: prodData['medicineForm'],
             howManyWeeks: prodData['howManyWeeks'],
             amount: prodData['amount'],
             afterfood: prodData['afterfood'],
          url: prodData['url']

        ));
      });

      _medicines = loadedMedicine;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
