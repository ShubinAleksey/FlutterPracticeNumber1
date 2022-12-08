import 'package:flutter_practice_2/domain/entity/colorproduct_entity.dart';
import 'package:flutter_practice_2/domain/entity/sizetovar_entity.dart';
import 'package:flutter_practice_2/domain/entity/tovar.dart';
import 'package:flutter_practice_2/domain/entity/typetovar_entity.dart';

class Tovar extends TovarEntity {
  late int id;
  final String nameTovar;
  final String date;
  final double price;
  final SizeTovarEnum idSize;
  final TypeTovarEnum idType;
  final ColorProductEnum idColor;

  Tovar({
    required this.nameTovar,
    required this.date,
    required this.price,
    required this.idSize,
    required this.idType,
    required this.idColor,
    }) :super(
      nameTovar: nameTovar,
      date: date,
      price: price,
      idSize: idSize,
      idType: idType,
      idColor: idColor);

  Map<String,dynamic> toMap() {
    return {
      'nameTovar': nameTovar,
      'date' : date,
      'price' : price,
      'id_size' : idSize.nameSize,
      'id_type' : idType.nameType,
      'id_color' : idColor.nameColor,
    };
  }

  factory Tovar.toFromMap(Map<String,dynamic> json) {
    return Tovar(nameTovar: json['nameTovar'],
    date: json['date'],
    price: json['price'],
    idSize: json['id_size'],
    idType: json['id_type'],
    idColor: json['id_color'],
    );
  } 
}