import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AiAgentView extends GetView<AiAgentViewController> {
  const AiAgentView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    Get.put<AiAgentViewController>(AiAgentViewController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              onProgressChanged: (InAppWebViewController inAppWebViewController,
                  int progress) {
                controller.setProgress(progress);
              },
              onWebViewCreated:
                  (InAppWebViewController inAppWebViewController) {
                controller.setWebViewController(inAppWebViewController);
              },
              initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
            ),
            Obx(() {
              final double progress = controller.progress.value;
              if (progress < 1) {
                return LinearProgressIndicator(value: progress);
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

class AiAgentViewController extends GetxController {
  RxDouble progress = 0.0.obs;
  setProgress(int newProgress) {
    progress.value = newProgress / 100;
  }

  InAppWebViewController? _inAppWebViewController;

  setWebViewController(InAppWebViewController controller) {
    _inAppWebViewController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    _inAppWebViewController?.dispose();
  }
}
