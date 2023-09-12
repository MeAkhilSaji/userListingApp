import 'dart:convert';
import 'package:dio/dio.dart';

part 'api_lists/user_lists.dart';
part 'api_lists/user_details.dart';

part 'models/user_lists_model.dart';
part 'models/user_details_model.dart';

part 'network/network.dart';

class UsersAPI {
  static Future<List<UserList>?> getUserLists(int page, int limit) async =>
      await _getUserList(page, limit);
  static Future<UserList?> getUserDetails(int id) async =>
      await _getUserDetails(id);
}
