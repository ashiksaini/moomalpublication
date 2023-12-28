import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/services/quiz_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class QuizController extends BaseController {
  final Rx<QuizResponse> quizResponse = Rx(QuizResponse());
  final List<QuizResponseModel> quizList = [];

  @override
  void onInit() {
    super.onInit();
    _getQuizList();
    ();
  }

  Future<void> _getQuizList() async {
    quizResponse.value = ApiResponse.loading();
    quizResponse.value = await QuizService.getQuizList();

    if (quizResponse.value.data != null) {
      quizList.clear();
      quizList.addAll(quizResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void navigateQuizDetailScreen({required int index}) {
    AppRouting.toNamed(NameRoutes.quizTestDetailScreen, argument: [
      {"index": index}
    ]);
  }

  void navigateQuizTestScreen({required int index}) {
    AppRouting.toNamed(NameRoutes.quizTestScreen, argument: [
      {"index": index}
    ]);
  }
}
