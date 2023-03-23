import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void onLoad(User user) {
    emit(UserData(user));
  }
}

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserData extends UserState {
  late User user;

  UserData(this.user);
}