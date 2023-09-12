part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

// ignore: must_be_immutable
final class UserDetailsLoaded extends UserDetailsState {
  UserList? userDetailedData;
  UserDetailsLoaded(this.userDetailedData);
}

// ignore: must_be_immutable
final class UserDetailsError extends UserDetailsState {
  String? message;
  UserDetailsError({this.message});
}

// final class UserDetailsLoadede extends UserDetailsState {
//   List<UserList>? userList;
//   UserDetailsLoadede({this.userList});
// }
