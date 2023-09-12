part of '../user_details_screen.dart';

class AddressViewCard extends StatelessWidget {
  const AddressViewCard({
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
                "Address",
                style: DetailsTextStyles.addressMainTitle,
              ),
              const SizedBox(height: 8.0),
              Text(
                details!.address!.address.toString(),
                style: DetailsTextStyles.addressComponents,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                child: Text(
                  details!.address!.city.toString(),
                  style: DetailsTextStyles.addressComponents,
                ),
              ),
              Text(
                details!.address!.postalCode.toString(),
                style: DetailsTextStyles.addressComponents,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Text(
                    details!.address!.state.toString(),
                    style: DetailsTextStyles.addressComponents,
                  )),
              InkWell(
                onTap: () async {
                  var lat = details!.address!.coordinates!.lat;
                  var lng = details!.address!.coordinates!.lng;
                  BlocProvider.of<UserDetailsCubit>(context)
                      .launchMap(lat, lng);
                },
                child: Text(
                  "view location",
                  style: DetailsTextStyles.locationView,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
