class ColorProductEntity{
  late int id;
  final String nameColor;

  ColorProductEntity({required this.nameColor,});
}

enum ColorProductEnum { 
  green(id: 1, nameColor:'Зеленый'), 
  orange(id: 2, nameColor:'Оранжевый'), 
  red(id: 3, nameColor:'Красный'),
  white(id: 4, nameColor:'Белый'), 
  black(id: 5, nameColor:'Черный'); 

  const ColorProductEnum({
    required this.id,
    required this.nameColor,
  });

  final int id;
  final String nameColor;
}