part of '../user_details_screen.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({
    super.key,
    required this.screenWidth,
    this.details,
  });
  final UserList? details;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: screenWidth < 600 ? double.infinity : 400.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: CommonDecorration.detaislScreenCardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Card and Account', style: DetailsTextStyles.cardHead),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(details!.bank!.cardNumber.toString(),
                style: DetailsTextStyles.cardNumber),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('VALID\nTHRU', style: DetailsTextStyles.SubHead),
                Text(details!.bank!.cardExpire.toString(),
                    style: DetailsTextStyles.SubHeadData),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Card Type', style: DetailsTextStyles.SubHead),
                Text(details!.bank!.cardType.toString(),
                    style: DetailsTextStyles.SubHeadData),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Iban', style: DetailsTextStyles.SubHead),
                Text(details!.bank!.iban.toString(),
                    overflow: TextOverflow.fade,
                    style: DetailsTextStyles.SubHeadIban),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Currency', style: DetailsTextStyles.SubHead),
                Text(details!.bank!.currency.toString(),
                    style: DetailsTextStyles.SubHeadData),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
