part of '../user_details_screen.dart';

// ignore: must_be_immutable
class CommonErrorDetailsScreen extends StatelessWidget {
  UserDetailsError state;
  int id;

  CommonErrorDetailsScreen({super.key, required this.state, required this.id});

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
            BlocProvider.of<UserDetailsCubit>(context).userDetails(id);
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
