import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model1/order_response_model1.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef OrderResponse = ApiResponse<List<OrderResponseModel1>>;
typedef OrderUpdateResponse = ApiResponse<OrderResponseModel>;
