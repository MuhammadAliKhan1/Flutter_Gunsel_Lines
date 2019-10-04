import 'package:gunsel/data/constants.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Pay extends StatefulWidget {
  final String payForm;

  Pay({
    @required this.payForm,
  });

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: Uri.dataFromString(widget.payForm,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString(),
      withJavascript: true,
      withLocalUrl: true,
      allowFileURLs: true,
      withLocalStorage: true,
    );
  }
}
/* 
class PayScreen extends StatefulWidget {
  final String payForm;
  PayScreen({
    @required this.payForm,
  });
  @override
  _PayScreenState createState() => _PayScreenState(
        payForm: payForm,
      );
}

class _PayScreenState extends State<PayScreen> {
  final String payForm;
  _PayScreenState({
    @required this.payForm,
  });
  WebViewController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {}

  void _loadHtmlFromAssets() {
    _controller.loadUrl(
      Uri.dataFromString(payForm,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString(),
    );
  }
} */
