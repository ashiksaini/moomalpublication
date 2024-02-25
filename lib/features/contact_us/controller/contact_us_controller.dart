import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/features/contact_us/data/address_model.dart';

class ContactUsController extends BaseController {
  List<Address> address = [];

  @override
  void onInit() {
    super.onInit();
    generateAddressList();
  }

  void generateAddressList() {
    address = [
      // Address(
      //     iconName: AppAssets.icLocation,
      //     addressHeader: 'ADDRESS',
      //     addressDescription:
      //         '50, Agrasen Nagar, Near Mahesh Nagar Phatak, Jaipur, (Rajasthan) 302015'),
      Address(
          iconName: AppAssets.icEmail,
          addressHeader: 'EMAIL',
          addressDescription: 'info@moomalpublication.com'),
      Address(
          iconName: AppAssets.icPhoneCall,
          addressHeader: 'PHONE',
          addressDescription:
              '+91 70144 10554 (For any Technical issue WhatsApp only)'),
    ];
  }
}
