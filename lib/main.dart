import 'package:flutter/material.dart';
import 'package:socio/model/generics.dart';
import 'package:socio/model/medicines.dart';
import 'package:socio/model/reports.dart';
import 'package:socio/screens/drugscreen.dart';
import 'package:socio/screens/genericscreen.dart';
import 'package:socio/screens/medicinescreen.dart';
import 'package:socio/screens/qrcode.dart';
import 'package:socio/screens/review.dart';
import 'package:socio/screens/timeline.dart';
import 'screens/homesceen.dart';import 'package:provider/provider.dart';
import 'model/drugs.dart';
import 'model/medicines.dart';
import 'calendar/calmain.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider.value(
        value: Medicines()),

      ChangeNotifierProvider.value(
          value: Reports()),
      ChangeNotifierProvider.value(
          value: Drugs()),
      ChangeNotifierProvider.value(
          value: Generics())
    ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.red,
        ),

        routes: {'/':(context)=>HomeScreen(),
          'timeline': (context)=>TimelineScreen(),
          'medicines':(context)=>MedicinesScreen(),
          'calendar':(context)=>EventCalendar(),
          'qrcode':(context)=>QrCode(),
          'drug':(context)=>DrugScreen(),
          'generic':(context)=>GenericScreen(),
          'review':(context)=>ReviewScreen()
        },
        initialRoute: '/',
      ),
    );
  }
}

