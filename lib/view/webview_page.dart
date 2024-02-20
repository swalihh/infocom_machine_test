import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View Screen'),
      ),
      body: WebViewContent(),
    );
  }
}

class WebViewContent extends StatefulWidget {
  @override
  _WebViewContentState createState() => _WebViewContentState();
}

class _WebViewContentState extends State<WebViewContent> {
  late WebViewController _webViewController;
   String? _htmlContent;

  @override
  void initState() {
    super.initState();
    loadHtmlContent();
  }

  Future<void> loadHtmlContent() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var filePath = '/data/user/0/com.example.infocom/app_flutter/extracted_files/Machine test build/index.html';
      _htmlContent = await File(filePath).readAsString();
      loadHtmlContent();
      setState(() {});
    } catch (error) {
      print('Error loading HTML content: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _htmlContent!=null&&  _htmlContent!.isNotEmpty
        ? WebViewWidget(controller: _webViewController)

        // WebView(
        //   initialUrl: 'about:blank',
        //   onWebViewCreated: (WebViewController webViewController) {
        //     _webViewController = webViewController;
        //     _loadHtmlContent();
        //   },
        // )
        : Center(child: CircularProgressIndicator());
  }

  Future<void> _loadHtmlContent() async {
    await _webViewController.loadFile((Uri.dataFromString(
      '/data/user/0/com.example.infocom/app_flutter/extracted_files/Machine test build/index.html',
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString()));
  }
}
