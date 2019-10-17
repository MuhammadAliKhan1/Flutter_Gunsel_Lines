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
  int counter = 0;
  bool loadScreen = false;
  FlutterWebviewPlugin flutterWebViewPlugin;
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin = FlutterWebviewPlugin();

    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      ++counter;
      if (url.contains('token')) {
        widget.userData['PaymentToken'] = url.substring(51);

        Navigator.of(context).pushNamedAndRemoveUntil(
            oneWayScreen, (Route<dynamic> route) => false);
        flutterWebViewPlugin.close();
        flutterWebViewPlugin.dispose();
        Navigator.pushNamed(
          context,
          paymentResultScreen,
          arguments: widget.userData,
        );
      }
      if (url == 'https://ecg.test.upc.ua/go/pay?locale=en#') {
        setState(() {
          flutterWebViewPlugin.close();
          flutterWebViewPlugin.dispose();
          Navigator.of(context).pushNamedAndRemoveUntil(
              oneWayScreen, (Route<dynamic> route) => false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: WebviewScaffold(
        url: Uri.dataFromString(
          widget.userData['PayFormHTML'],
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ).toString(),
        withJavascript: true,
        withLocalUrl: true,
        allowFileURLs: true,
        withLocalStorage: true,
      ),
      onWillPop: () {
        flutterWebViewPlugin.dispose();
        flutterWebViewPlugin.close();
        Navigator.of(context).pop();
      },
    );
  }
}
