part of '../user_details_screen.dart';

class CompanyAddressCard extends StatelessWidget {
  const CompanyAddressCard({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth < 600 ? double.infinity : 400.0,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                    "Company Address & Details",
                    style: DetailsTextStyles.addressMainTitle,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details!.company!.name.toString(),
                    style: DetailsTextStyles.addressComponents,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.department.toString(),
                      style: DetailsTextStyles.addressComponents,
                    ),
                  ),
                  Text(
                    details!.company!.address!.address.toString(),
                    style: DetailsTextStyles.addressComponents,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.address!.city.toString(),
                      style: DetailsTextStyles.addressComponents,
                    ),
                  ),
                  Text(
                    details!.company!.address!.postalCode.toString(),
                    style: DetailsTextStyles.addressComponents,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Text(
                      details!.company!.address!.state.toString(),
                      style: DetailsTextStyles.addressComponents,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      var lat = details!.company!.address!.coordinates!.lat;
                      var lng = details!.company!.address!.coordinates!.lng;
                      BlocProvider.of<UserDetailsCubit>(context)
                          .launchMap(lat, lng);
                    },
                    child: Text(
                      "view location",
                      style: DetailsTextStyles.locationView,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
