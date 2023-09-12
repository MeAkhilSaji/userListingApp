import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpayback/Api/api.dart';
import 'package:xpayback/core/core_ui.dart';
import 'package:xpayback/user_data_list_screen/cubit/user_list_cubit.dart';
import 'package:xpayback/user_details_screen/user_details_screen.dart';

part 'components/users_listing_builder.dart';
part 'components/users_listing_view_element.dart';
part 'components/common_error.dart';

class UserDataList extends StatelessWidget {
  static const String route = '/';
  const UserDataList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text("User List", style: ListingTextStyles.appBar)),
          ),
          body: const UserDataListFrame()),
    );
  }
}

class UserDataListFrame extends StatefulWidget {
  const UserDataListFrame({super.key});
  @override
  State<UserDataListFrame> createState() => _UserDataListFrameState();
}

class _UserDataListFrameState extends State<UserDataListFrame> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<UserListCubit>(context).getMoreDataFetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListCubit, UserListState>(
      builder: (context, state) {
        if (state is UserListInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserListError) {
          return CommonErrorListScreen(state: state);
        }
        return UsersListingBuilder(scrollController: _scrollController);
      },
    );
  }
}
