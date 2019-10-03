import 'package:gunsel/data/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pay extends StatelessWidget {
  final String payForm;
  Pay({
    @required this.payForm,
  });

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: false,
      backgroundImage: scaffoldImg,
      appBarIcon: backArrow,
      bodyWidget: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: PayScreen(
            payForm: payForm,
          ),
        ),
      ),
      appBarTitleIncluded: false,
      drawerIncluded: false,
    );
  }
}

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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  void _loadHtmlFromAssets() {
    _controller.loadUrl(
      Uri.dataFromString(payForm,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString(),
    );
  }
}
