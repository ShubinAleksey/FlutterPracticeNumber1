import 'package:flutter_practice_2/domain/entity/typetovar_entity.dart';

class TypeTovar extends TypeTovarEntity {
  late int id;
  final String nameType;

  TypeTovar({required this.nameType}) :super(nameType: nameType);

  Map<String,dynamic> toMap() {
    return {
      'nameType': nameType,
    };
  }

  factory TypeTovar.toFromMap(Map<String,dynamic> json) {
    return TypeTovar(nameType: json['nameType']);
  } 
}