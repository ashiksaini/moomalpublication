import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/models/test_response_model.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef QuizResponse = ApiResponse<List<QuizResponseModel>>;
typedef TestResponse = ApiResponse<List<TestQuestionsResponseModel>>;
