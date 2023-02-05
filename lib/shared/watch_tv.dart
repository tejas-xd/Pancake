import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExampleTV extends StatefulWidget {
  const WebViewExampleTV({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  WebViewExampleTVState createState() => WebViewExampleTVState();
}

class WebViewExampleTVState extends State<WebViewExampleTV> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://2embed.org/embed/series?tmdb=${widget.id}',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (navigation) => NavigationDecision.prevent,
      ),
    );
  }


  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}