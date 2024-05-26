import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/contact_us/data/address_model.dart';
import 'package:moomalpublication/features/contact_us/data/constants/emuns.dart';

class ContactUsController extends BaseController {
  List<Address> address = [];

  @override
  void onInit() {
    super.onInit();
    generateAddressList();
  }

  void generateAddressList() {
    address = [
      Address(
        iconName: AppAssets.icEmail,
        addressHeader: 'EMAIL',
        addressDescription:
            '<strong><u> info@moomalpublication.com </u></strong>',
        contactType: ContactType.email,
      ),
      Address(
        iconName: AppAssets.icPhoneCall,
        addressHeader: 'PHONE',
        addressDescription:
            '<strong><u> +91 70144 10554 </u> (For any Technical issue WhatsApp only)</strong>',
        contactType: ContactType.phoneNumber,
      ),
    ];
  }

  void onContactClick(ContactType contactType) {
    if (contactType == ContactType.email) {
      Utility.sendToGmail('info@moomalpublication.com');
    } else {
      Utility.sendToWhatsapp("+917014410554");
    }
  }
}
