import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PubAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PubAppbar({super.key, this.automaticallyImplyLeading = true});
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1c2834),
      title: SvgPicture.network(
        'https://pub.dev/static/hash-6pt3begn/img/pub-dev-logo.svg',
        width: 150,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: BackButton(
        onPressed: () {
          context.beamBack();
          // Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
