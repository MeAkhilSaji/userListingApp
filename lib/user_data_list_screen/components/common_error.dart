part of '../user_data_list.dart';

// ignore: must_be_immutable
class CommonErrorListScreen extends StatelessWidget {
  UserListError state;
  CommonErrorListScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(state.message != null
                ? state.message.toString()
                : "Something went wrong")),
        InkWell(
          onTap: () {
            BlocProvider.of<UserListCubit>(context).initialFetch();
          },
          child: Container(
            color: const Color.fromARGB(255, 95, 71, 249),
            height: 50,
            width: 100,
            child: const Text(
              'Retry',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
