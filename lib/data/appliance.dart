import 'dart:convert';
import 'package:flutter/services.dart';

class Appliance {
  final int id;
  final String name;
  final int watts;

  Appliance({
    required this.id,
    required this.name,
    required this.watts,
  });

  factory Appliance.fromJson(Map<String, dynamic> json) {
    return Appliance(
      id: json['id'],
      name: json['name'],
      watts: json['watts'],
    );
  }
}

Future<List<Appliance>> loadAppliances() async {
  final String response = await rootBundle.loadString('assets/data/appliances.json');
  final List<dynamic> data = json.decode(response);

  return data.map((json) => Appliance.fromJson(json)).toList();
}
