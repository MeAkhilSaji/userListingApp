part of '../user_details_screen.dart';

class PersonalInfo extends StatelessWidget {
  final double screenWidth;
  final UserList? details;

  const PersonalInfo({super.key, required this.screenWidth, this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth < 600 ? double.infinity : 400.0,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalInfoCard(screenWidth: screenWidth, details: details),
            AddressViewCard(screenWidth: screenWidth, details: details)
          ],
        ),
      ),
    );
  }
}
