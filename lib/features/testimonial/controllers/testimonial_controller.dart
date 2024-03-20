import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/testimonial/data/constants/type_alias.dart';
import 'package:moomalpublication/features/testimonial/data/models/testimonial_response_model.dart';
import 'package:moomalpublication/features/testimonial/data/services/testimonial_service.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class TestimonialController extends BaseController {
  final Rx<TestimonialResponse> testimonialResponse = Rx(TestimonialResponse());
  final List<TestimonialResponseModel> testimonials = [];

  @override
  void onInit() {
    super.onInit();
    _getTestimonialDetials();
  }

  Future<void> _getTestimonialDetials() async {
    testimonialResponse.value = ApiResponse.loading();
    testimonialResponse.value = await TestimonialService.getTestimonials();

    if (testimonialResponse.value.data != null) {
      if (testimonialResponse.value.data!.status!
              .compareTo(AppConstants.successfulResponse) ==
          0) {
        if (testimonialResponse.value.data!.data != null &&
            testimonialResponse.value.data!.data!.isNotEmpty) {
          testimonials.addAll(testimonialResponse.value.data!.data!);
        }
      } else {
        showToast(testimonialResponse.value.data!.message.toString());
      }
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }
}
