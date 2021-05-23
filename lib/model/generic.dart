
import 'dart:convert';

Generic genericFromMap(String str) => Generic.fromMap(json.decode(str));
List<Generic> genericf(List<dynamic> jsonlist){
  final List<Generic> g = [];
  jsonlist.forEach((element) {g.add(Generic.fromMap(element)); });
  return g;
}
String genericToMap(Generic data) => json.encode(data.toMap());


class Generic {
  Generic({
    this.name,
    this.genericId,
    this.theraupticUses,
    this.searchScore,
  });

  final String name;
  final int genericId;
  final List<String> theraupticUses;
  final double searchScore;

  factory Generic.fromMap(Map<String, dynamic> json) => Generic(
    name: json["name"] == null ? null : json["name"],
    genericId: json["generic_id"] == null ? null : json["generic_id"],
    theraupticUses: json["therauptic_uses"] == null ? null : List<String>.from(json["therauptic_uses"].map((x) => x)),
    searchScore: json["search_score"] == null ? null : json["search_score"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "generic_id": genericId == null ? null : genericId,
    "therauptic_uses": theraupticUses == null ? null : List<dynamic>.from(theraupticUses.map((x) => x)),
    "search_score": searchScore == null ? null : searchScore,
  };
}
