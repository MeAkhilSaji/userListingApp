part of '../api.dart';

Future<List<UserList>?> _getUserList(int page, int limit) async {
  try {
    final Response response =
        await NetworkHelper.get('?limit=$limit&skip=$page');
    if (response.statusCode == 200 && response.data["users"] != null) {
      List<UserList> a = userListFromJson(response.data["users"]);
      return a;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
