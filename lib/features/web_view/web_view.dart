import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/routes/routing.dart';

import '../../services/storage/shared_preferences_helper.dart';
import '../../services/storage/shared_preferences_keys.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // late InAppWebViewController _webViewController;

  String url = "";
  String testName = "";
  double progress = 0;
  String authToken = "";

  @override
  void initState() {
    super.initState();

    SharedData sharedData = Get.arguments;
    testName = sharedData.testName ?? "";
    url = sharedData.testUrl ?? "";

    getAuthToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: <Widget>[
              CustomAppbar(
                title: testName,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
              ),
              Container(
                  margin: EdgeInsets.only(top: 2.v),
                  child: progress < 1.0
                      ? LinearProgressIndicator(
                          value: progress,
                          color: AppColors.orange,
                        )
                      : Container()),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(url),
                    headers: {
                      'Authorization': 'Bearer $authToken',
                    },
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    // _webViewController = controller;
                  },
                  onLoadStart:
                      (InAppWebViewController controller, WebUri? uri) {
                    setState(() {
                      url = uri.toString();
                    });
                  },
                  onLoadStop:
                      (InAppWebViewController controller, WebUri? uri) async {
                    setState(() {
                      url = uri.toString();
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getAuthToken() async {
    authToken = (await SharedPreferencesHelper.getString(
      SharedPreferenceKeys.token,
    ))!;
  }
}
