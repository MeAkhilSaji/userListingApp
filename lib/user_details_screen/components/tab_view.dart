part of '../user_details_screen.dart';

class UserTabBarViews extends StatelessWidget {
  const UserTabBarViews(
      {super.key,
      required TabController controller,
      required this.screenWidth,
      this.details})
      : _controller = controller;

  final TabController _controller;
  final double screenWidth;
  final UserList? details;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: [
          PersonalInfo(screenWidth: screenWidth, details: details),
          CompanyAddressCard(screenWidth: screenWidth, details: details),
          BankDetails(screenWidth: screenWidth, details: details)
        ],
      ),
    );
  }
}
