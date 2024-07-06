import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class ProfileController extends BaseController {
  RxString userName = RxString("");
  RxString userEmail = RxString("");
  Rx<String?> userAvatar = Rx(null);
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> image = Rx(null);

  @override
  void onInit() {
    super.onInit();

    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    userName.value = await SharedPreferencesHelper.getString(
            SharedPreferenceKeys.username) ??
        "";
    userEmail.value =
        await SharedPreferencesHelper.getString(SharedPreferenceKeys.email) ??
            "";
    userAvatar.value = await SharedPreferencesHelper.getString(
            SharedPreferenceKeys.avatarUrl);
  }

  Future getImageFromGallery() async {
      var res = await _picker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        image.value = res;
      }
    }
}
