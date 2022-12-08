class TypeTovarEntity{
  late int id;
  final String nameType;

  TypeTovarEntity({required this.nameType,});
}

enum TypeTovarEnum { 
  pants(id: 1, nameType:'Штаны'), 
  shirts(id: 2, nameType:'Футболки'),
  shorts(id: 3, nameType:'Шорты'), 
  jersey(id: 4, nameType:'Свитер'), 
  tshirts(id: 5, nameType:'Майки');

  const TypeTovarEnum({
    required this.id,
    required this.nameType,
  });

  final int id;
  final String nameType;
}