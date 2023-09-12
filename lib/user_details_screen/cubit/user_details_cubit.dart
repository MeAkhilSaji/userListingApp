// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:xpayback/Api/api.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  void userDetails(int id) async {
    UserList? userDetails = await UsersAPI.getUserDetails(id);
    if (userDetails == null) {
      UserDetailsError(message: "Error Has occured..Try Again..");
    }
    emit(UserDetailsLoaded(userDetails));
  }

  void launchEmailURL(String mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
    );
    String url = params.toString();
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> launchMap(double? lat, double? lng) async {
    var uri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
