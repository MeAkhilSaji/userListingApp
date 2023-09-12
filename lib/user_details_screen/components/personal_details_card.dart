part of '../user_details_screen.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Card(
        elevation: 5, // Add elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: DetailsTextStyles.addressMainTitle,
              ),
              const SizedBox(height: 8.0),
              DataKeyValueDesign(
                  keyName: "Name",
                  keyValue: "${details!.firstName} ${details!.lastName}"),
              DataKeyValueDesign(
                  keyName: "Dob",
                  keyValue:
                      " ${details!.birthDate!.year}-${details!.birthDate!.month}-${details!.birthDate!.day}"),
              DataKeyValueDesign(keyName: "Age", keyValue: " ${details!.age}"),
              DataKeyValueDesign(
                  keyName: "Gender", keyValue: " ${details!.gender}"),
              DataKeyValueDesign(
                  keyName: "Height", keyValue: " ${details!.height}"),
              DataKeyValueDesign(
                  keyName: "Height", keyValue: " ${details!.weight}"),
              DataKeyValueDesign(
                  keyName: "Blood", keyValue: " ${details!.bloodGroup}"),
              DataKeyValueDesign(
                  keyName: "Eye Color", keyValue: " ${details!.eyeColor}"),
              DataKeyValueDesign(
                  keyName: "Hiar",
                  keyValue: " ${details!.hair!.color}  ${details!.hair!.type}"),
              const Divider(color: Colors.black),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Connect Through",
                  style: DetailsTextStyles.addressMainTitle,
                ),
              ),
              DataKeyValueDesign(
                  keyName: "username", keyValue: " ${details!.username}"),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserDetailsCubit>(context)
                      .makePhoneCall(details!.phone.toString());
                },
                child: DataKeyValueDesign(
                    keyName: "Phone", keyValue: " ${details!.phone}"),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserDetailsCubit>(context)
                      .launchEmailURL(details!.email.toString());
                },
                child: DataKeyValueDesign(
                    keyName: "Email", keyValue: " ${details!.email}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataKeyValueDesign extends StatelessWidget {
  final String keyName;
  final String keyValue;

  const DataKeyValueDesign({
    super.key,
    required this.keyName,
    required this.keyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Wrap(
        children: <Widget>[
          SizedBox(
              width: 100,
              child: Text(keyName,
                  style: DetailsTextStyles.addressTitleComponents)),
          Text(keyValue,
              style: keyName == "Phone" || keyName == "Email"
                  ? DetailsTextStyles.addressComponentsUrl
                  : DetailsTextStyles.addressComponents),
        ],
      ),
    );

    // return DataTable(
    //   headingRowHeight: 5,
    //   dataRowHeight: 20,
    //   columns: const [
    //     DataColumn(
    //       label: Text(''),
    //     ),
    //     DataColumn(
    //       label: Text(''),
    //     ),
    //   ],
    //   dividerThickness: 0,
    //   horizontalMargin: 3,
    //   rows: [
    //     DataRow(cells: [
    //       DataCell(Container(
    //         alignment: Alignment.center,
    //         child:
    //             Text(keyName, style: DetailsTextStyles.addressTitleComponents),
    //       )),
    //       DataCell(
    //         Container(
    //             alignment: Alignment.centerLeft,
    //             child:
    //                 Text(keyValue, style: DetailsTextStyles.addressComponents)),
    //       ),
    //     ]),
    //   ],
    // );
  }
}
