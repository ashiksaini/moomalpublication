import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:moomalpublication/core/base/base_controller.dart';

class InternetConnectivityController extends BaseController {
  final Connectivity _connectivity = Connectivity();
  final RxBool haveInternetConnection = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    _checkInternetConnection();

    _observeInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    haveInternetConnection.value = await InternetConnectionChecker().hasConnection;
  }

  void _observeInternetConnection() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        _checkInternetConnection();
      }
    });
  }
}
