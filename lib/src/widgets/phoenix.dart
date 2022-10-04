import 'package:flutter/widgets.dart';
import 'package:beamer/beamer.dart';

/// Wrap your root App widget in this widget and call [Phoenix.rebirth] to restart your app.
class Phoenix extends StatefulWidget {
  final Widget child;

  Phoenix({Key? key, required this.child}) : super(key: key);

  @override
  _PhoenixState createState() => _PhoenixState();

  static void rebirth(BuildContext context) {
    context.findAncestorStateOfType<_PhoenixState>()!.restartApp();
  }
}

class _PhoenixState extends State<Phoenix> {
  Key _key = UniqueKey();

  void restartApp() {
    // setState(() {
    //   _key = UniqueKey();
    // });
    context.beamToReplacementNamed('/splash_screen');
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
