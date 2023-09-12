part of '../user_data_list.dart';

class UsersListViewElements extends StatelessWidget {
  const UsersListViewElements({super.key, required this.userElemet});
  final UserList userElemet;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserDetails(detailsId: userElemet.id),
                    ));
              },
              leading: CircleAvatar(
                child: Image.network(userElemet.image.toString()),
              ),
              title: Text(
                "${userElemet.firstName!} ${userElemet.lastName!}",
                style: ListingTextStyles.heading,
              ),
              subtitle: Text(userElemet.company!.title.toString()),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
