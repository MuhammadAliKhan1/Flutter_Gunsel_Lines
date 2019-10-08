import 'package:gunsel/data/constants.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Pay extends StatefulWidget {
  final Map<String, dynamic> userData;

  Pay({
    @required this.userData,
  });

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  FlutterWebviewPlugin flutterWebViewPlugin;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin = FlutterWebviewPlugin();

    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      counter++;

      if (counter == 2) {
        flutterWebViewPlugin.close();
        Navigator.of(context).pushNamedAndRemoveUntil(
            oneWayScreen, (Route<dynamic> route) => false);
        Navigator.pushNamed(
          context,
          paymentResultScreen,
          arguments: widget.userData,
        );
      }
      if (url == 'https://ecg.test.upc.ua/go/pay?locale=en#')
        setState(() {
          flutterWebViewPlugin.close();
          Navigator.of(context).pushNamedAndRemoveUntil(
              oneWayScreen, (Route<dynamic> route) => false);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: Uri.dataFromString(
        widget.userData['PayFormHTML'],
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString(),
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