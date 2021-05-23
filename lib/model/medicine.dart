import 'dart:core';
class Medicine {
  String id;
  String name;
  int amount;
  String type;
  int howManyWeeks;
  String medicineForm;
  int time;
  int notifyId;
  bool afterfood;
  String url;
String description;
  Medicine(
      {this.id,
        this.howManyWeeks,
        this.time,
        this.amount,
        this.medicineForm,
        this.name,this.description,
        this.type,
        this.notifyId,
      this.afterfood,this.url});


}