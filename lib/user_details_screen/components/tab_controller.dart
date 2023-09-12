part of '../user_details_screen.dart';

class UserDefaultTabController extends StatelessWidget {
  const UserDefaultTabController(
      {super.key, required TabController controller, required this.details})
      : _controller = controller;

  final TabController _controller;
  final UserList? details;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        controller: _controller,
        labelStyle: DetailsTextStyles.tab,
        tabs: const [
          Tab(text: 'User'),
          Tab(text: 'Company'),
          Tab(text: 'Bank'),
        ],
      ),
    );
  }
}
