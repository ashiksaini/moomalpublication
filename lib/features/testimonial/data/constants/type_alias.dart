import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/features/testimonial/data/models/testimonial_response_model.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef TestimonialResponse
    = ApiResponse<BaseResponse<List<TestimonialResponseModel>>>;
