part of 'user_list_cubit.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}

// ignore: must_be_immutable
final class UserListError extends UserListState {
  String? message;
  UserListError({this.message});
}

// ignore: must_be_immutable
final class UserListLoaded extends UserListState {
  List<UserList>? userList;
  UserListLoaded({this.userList});
}

// ignore: must_be_immutable
final class UserListLoadedwithFetch extends UserListState {
  List<UserList>? userList;
  UserListLoadedwithFetch({this.userList});
}
