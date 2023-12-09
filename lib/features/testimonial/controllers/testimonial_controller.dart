import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/testimonial/constants/type_alias.dart';
import 'package:moomalpublication/features/testimonial/data/services/testimonial_service.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class TestimonialController extends BaseController {
  final Rx<TestimonialResponse> testimonialResponse = Rx(TestimonialResponse());
  @override
  void onInit() {
    super.onInit();
    _getTestimonialDetials();
  }

  //  Future<void> _getBestSellerBooks() async {
  //   bestSellerProductResponse.value = ApiResponse.loading();
  //   bestSellerProductResponse.value = await GetProductServices.getProducts(query: _getQueryParams(perPage: 4, orderBy: "popularity", order: "desc"));

  //   if (bestSellerProductResponse.value.data != null) {
  //     bestSellerProductList.addAll(bestSellerProductResponse.value.data ?? []);
  //   } else {
  //     showSnackBar(AppConstants.somethingWentWrong);
  //   }
  // }


  Future<void> _getTestimonialDetials() async {
    testimonialResponse.value = ApiResponse.loading();
    testimonialResponse.value = await TestimonialService.getTestimonials();

    if (testimonialResponse.value.data != null) {
      if (testimonialResponse.value.data!.status!
              .compareTo(AppConstants.successfulResponse) ==
          0) {
            print(testimonialResponse.value.data);
      } else {
        showSnackBar(testimonialResponse.value.data!.message.toString());
      }
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }
}
