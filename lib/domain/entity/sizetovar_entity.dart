class SizeTovarEntity{
  late int id;
  final String nameSize;

  SizeTovarEntity({required this.nameSize,});
}

enum SizeTovarEnum { 
  xs(id: 1, nameSize:'XS'), 
  s(id: 2, nameSize:'S'), 
  m(id: 3, nameSize:'M'), 
  l(id: 4, nameSize:'L'), 
  xl(id: 5, nameSize:'XL'), 
  xxl(id: 6, nameSize:'XXL');

  const SizeTovarEnum({
    required this.id,
    required this.nameSize,
  });

  final int id;
  final String nameSize;
}