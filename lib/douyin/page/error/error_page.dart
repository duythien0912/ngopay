import 'package:flutter/material.dart';

import '../../utils/asset_bundle_utils.dart';

/// @author jd

class ErrorPage extends StatefulWidget {
  ErrorPage(this.errorMessage, this.details);
  final String errorMessage;
  final FlutterErrorDetails details;

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static List<Map<String, dynamic>> sErrorStack = <Map<String, dynamic>>[];
  static List<String> sErrorName = <String>[];

  final TextEditingController textEditingController = TextEditingController();

  void addError(FlutterErrorDetails details) {
    try {
      final map = <String, dynamic>{};
      map['error'] = details.toString();
      addLogic(sErrorName, details.exception.runtimeType.toString());
      addLogic(sErrorStack, map);
    } catch (e) {
      print(e);
    }
  }

  void addLogic(List list, dynamic data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return Material(
      child: Container(
        color: Colors.red,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.errorMessage,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          image: AssetImage(
                            AssetBundleUtils.getIconPath('logo'),
                          ),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const Text(
                        '???????????????',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          var content = widget.errorMessage;
                          textEditingController.text = content;
                          print('?????????????????????');
                        },
                        child: const Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
