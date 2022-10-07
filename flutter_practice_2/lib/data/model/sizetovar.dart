import 'package:flutter_practice_2/domain/entity/sizetovar_entity.dart';

class SizeTovar extends SizeTovarEntity {
  late int id;
  final String nameSize;

  SizeTovar({required this.nameSize}) :super(nameSize: nameSize);

  Map<String,dynamic> toMap() {
    return {
      'nameSize': nameSize,
    };
  }

  factory SizeTovar.toFromMap(Map<String,dynamic> json) {
    return SizeTovar(nameSize: json['nameSize']);
  } 
}