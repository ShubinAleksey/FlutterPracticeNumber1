import 'package:flutter_practice_2/domain/entity/colorproduct_entity.dart';

class ColorTovar extends ColorProductEntity {
  late int id;
  final String nameColor;

  ColorTovar({required this.nameColor}) :super(nameColor: nameColor);

  Map<String,dynamic> toMap() {
    return {
      'nameColor': nameColor,
    };
  }

  factory ColorTovar.toFromMap(Map<String,dynamic> json) {
    return ColorTovar(nameColor: json['nameColor']);
  } 
}