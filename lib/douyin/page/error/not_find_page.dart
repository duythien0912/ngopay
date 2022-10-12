import 'package:flutter/material.dart';

/// @author jd

class NotFindPage extends StatefulWidget {
  final String title = '404';

  const NotFindPage({Key? key}) : super(key: key);

  @override
  State createState() => _NotFindPageState();
}

class _NotFindPageState extends State<NotFindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: const <Widget>[
            Text('not found'),
          ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
