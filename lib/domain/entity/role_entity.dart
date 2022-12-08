class RoleEntity{
  late int id;
  final String role;

  RoleEntity({required this.role,});
}

enum RoleEnum { 
  
  admin(id: 1, name:'Администратор'),
  cassir(id: 2, name:'Кассир-Продавец');
  
  const RoleEnum({
    required this.id,
    required this.name,
    });

  final int id;
  final String name;
}