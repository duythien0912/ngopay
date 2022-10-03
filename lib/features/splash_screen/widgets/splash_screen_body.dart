import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/splash_screen/controller/controller.dart';

class SplashScreenBody extends ConsumerStatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenBodyState();
}

class _SplashScreenBodyState extends ConsumerState<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) => _init());
  }

  void _init() {
    ref.read(splashScreenController).init(context);
  }

  @override
  Widget build(BuildContext context) {
    const _bottom = 120.0;
    return Container(
      color: NgopayColors.primary,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: _bottom),
              child: Text(
                'Ngopay',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: NgopayColors.secondary2,
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: _bottom),
              child: SizedBox(
                height: 50,
                width: 50,
                child: const CurvedCircularProgressIndicator(
                  color: NgopayColors.secondary2,
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    NgopayColors.secondary2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
