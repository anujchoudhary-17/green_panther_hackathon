
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class BlogPostsView extends StatefulWidget {
  const BlogPostsView({Key? key}) : super(key: key);

  @override
  _BlogPostsViewState createState() => _BlogPostsViewState();
}

class _BlogPostsViewState extends State<BlogPostsView> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://hackgreenpanther.blogspot.com/',
    );
  }
}
