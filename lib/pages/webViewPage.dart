import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebviewPage extends StatelessWidget {
  final String url;
  const WebviewPage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(),
        // ),
        body: SafeArea(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      );
  }
}