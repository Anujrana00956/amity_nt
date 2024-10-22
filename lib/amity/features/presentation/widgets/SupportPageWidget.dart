
import 'package:amity_nt/amity/app/core/constant/app_color_constsnt.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          }))
      ..setBackgroundColor(Colors.white)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Image.asset(
          'assets/logo 1.png',
          scale: 10,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SafeArea(
            left: false,
            right: false,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
          if (isLoading == true)
            const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
        ],
      ),
    );
  }
}
