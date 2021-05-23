import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'report.dart';
class Reports with ChangeNotifier {
  List<Report> _report = [];

  List<Report> get items {
    return [..._report];
  }

  Future<void> fetchReport() async {
    const url = 'https://inigma-5744a-default-rtdb.firebaseio.com/reports.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Report> loadedReport = [];
      extractedData.forEach((prodId, prodData) {
        print(prodData);
        print(prodId.runtimeType);
        loadedReport.add(Report(
                eval1: prodData['eval1'],
          eval1score: prodData['eval1score'],
          id: prodId,
          date: prodData['date'],
          eval2: prodData['eval2'],
          eval2score: prodData['eval2score'],
          eval3: prodData['eval3'],
          eval3score: prodData['eval3score'],
          note: 'Improvement'


        ));
      });

      _report = loadedReport;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
