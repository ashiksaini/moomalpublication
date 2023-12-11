import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/features/auth/data/models/login_response_data.dart';
import 'package:moomalpublication/features/auth/data/models/user_data.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef LoginResponse = ApiResponse<BaseReponse<LoginResponseData>>;
typedef ResetPasswordResponse = ApiResponse<BaseReponse<UserData>>;
typedef RegisterUserResponse = ApiResponse<BaseReponse<UserData>>;
