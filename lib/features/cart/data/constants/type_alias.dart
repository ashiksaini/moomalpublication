import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/cart_data.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef CartDataResponse = ApiResponse<CartData>;
typedef CartUpdateItemResponse = ApiResponse<BaseResponse<CartData>>;
