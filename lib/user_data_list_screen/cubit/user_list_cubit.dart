// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:xpayback/Api/api.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListInitial()) {
    initialFetch();
  }
  int page = 0;
  static const limit = 10;
  bool hasReachedMax = false;

  List<UserList>? userList = [];
  void initialFetch() async {
    page = 0;
    hasReachedMax = false;
    userList = await UsersAPI.getUserLists(page, limit);
    if (userList == null || (userList != null && userList!.isEmpty)) {
      emit(UserListError());
    }
    emit(UserListLoaded(userList: userList));
  }

  void getMoreDataFetch() async {
    page++;
    List<UserList>? tempList = [];
    emit(UserListLoadedwithFetch(userList: userList));
    tempList = await UsersAPI.getUserLists(page, limit);
    if (tempList == null) {
      // ignore: use_build_context_synchronously
      // CommonAlert.showAlertDialog(context);
      emit(UserListLoaded(userList: userList));
    }
    if (tempList != null && tempList.isEmpty) {
      //limit has reached
      hasReachedMax = true;
      emit(UserListLoaded(userList: userList));
    } else if (tempList != null && tempList.isNotEmpty) {
      userList!.addAll(tempList);
      emit(UserListLoaded(userList: userList));
    }
  }
}
