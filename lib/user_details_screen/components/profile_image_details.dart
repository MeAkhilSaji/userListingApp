part of '../user_details_screen.dart';

class ProfileImageAndDetails extends StatelessWidget {
  const ProfileImageAndDetails({
    super.key,
    required this.widget,
    required this.details,
  });

  final ProfileInfoTab widget;
  final UserList? details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const SizedBox(height: 20.0),
          CircleAvatar(
            radius: widget.screenWidth < 600 ? 40.0 : 60.0,
            backgroundImage: NetworkImage(details!.image.toString()),
          ),
          const SizedBox(height: 20.0, width: 25),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text("${details!.firstName!} ${details!.lastName!}",
                    style: widget.screenWidth < 600
                        ? DetailsTextStyles.headData
                        : DetailsTextStyles.headDataWeb),
                const SizedBox(height: 10.0),
                Text(details!.company!.title.toString(),
                    overflow: TextOverflow.fade,
                    style: widget.screenWidth < 600
                        ? DetailsTextStyles.job
                        : DetailsTextStyles.jobweb),
                const SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
