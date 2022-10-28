import 'package:flutter_practice_2/domain/entity/colorproduct_entity.dart';
import 'package:flutter_practice_2/domain/entity/sizetovar_entity.dart';
import 'package:flutter_practice_2/domain/entity/typetovar_entity.dart';

class TovarEntity{
  late int id;
  final String nameTovar;
  final String date;
  final double price;
  final SizeTovarEnum idSize;
  final TypeTovarEnum idType;
  final ColorProductEnum idColor;

  TovarEntity({
    required this.nameTovar,
    required this.date,
    required this.price,
    required this.idSize,
    required this.idType,
    required this.idColor,
  });
}