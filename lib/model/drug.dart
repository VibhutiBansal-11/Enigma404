import 'dart:convert';
Drug drugFromMap(String str) => Drug.fromMap(json.decode(str));
List<Drug> vib(List<dynamic> jsonlist){
  final List<Drug> x = [];
  jsonlist.forEach((element) {x.add(Drug.fromMap(element)); });
  return x;
}
String drugToMap(Drug data) => json.encode(data.toMap());
class Drug {
  Drug({
    this.name,
    this.form,
    this.standardUnits,
    this.packageForm,
    this.price,
    this.size,
    this.manufacturer,
    this.constituents,
    this.schedule,
    this.id,
    this.medicineId,
    this.searchScore,
  });

  final String name;
  final String form;
  final int standardUnits;
  final String packageForm;
  final double price;
  final String size;
  final String manufacturer;
  final List<Constituent> constituents;
  final Schedule schedule;
  final String id;
  final String medicineId;
  final double searchScore;

  factory Drug.fromMap(Map<String, dynamic> json) => Drug(
    name: json["name"] == null ? null : json["name"],
    form: json["form"] == null ? null : json["form"],
    standardUnits: json["standardUnits"] == null ? null : json["standardUnits"],
    packageForm: json["packageForm"] == null ? null : json["packageForm"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    size: json["size"] == null ? null : json["size"],
    manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
    constituents: json["constituents"] == null ? null : List<Constituent>.from(json["constituents"].map((x) => Constituent.fromMap(x))),
    schedule: json["schedule"] == null ? null : Schedule.fromMap(json["schedule"]),
    id: json["id"] == null ? null : json["id"],
    medicineId: json["medicine_id"] == null ? null : json["medicine_id"],
    searchScore: json["search_score"] == null ? null : json["search_score"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "form": form == null ? null : form,
    "standardUnits": standardUnits == null ? null : standardUnits,
    "packageForm": packageForm == null ? null : packageForm,
    "price": price == null ? null : price,
    "size": size == null ? null : size,
    "manufacturer": manufacturer == null ? null : manufacturer,
    "constituents": constituents == null ? null : List<dynamic>.from(constituents.map((x) => x.toMap())),
    "schedule": schedule == null ? null : schedule.toMap(),
    "id": id == null ? null : id,
    "medicine_id": medicineId == null ? null : medicineId,
    "search_score": searchScore == null ? null : searchScore,
  };
}

class Constituent {
  Constituent({
    this.name,
    this.strength,
  });

  final String name;
  final String strength;

  factory Constituent.fromMap(Map<String, dynamic> json) => Constituent(
    name: json["name"] == null ? null : json["name"],
    strength: json["strength"] == null ? null : json["strength"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "strength": strength == null ? null : strength,
  };
}

class Schedule {
  Schedule({
    this.category,
    this.label,
  });

  final String category;
  final String label;

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
    category: json["category"] == null ? null : json["category"],
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toMap() => {
    "category": category == null ? null : category,
    "label": label == null ? null : label,
  };
}
