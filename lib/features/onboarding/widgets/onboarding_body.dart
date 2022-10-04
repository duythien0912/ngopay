import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/onboarding/controller/controller.dart';

class OnboardingBody extends ConsumerStatefulWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends ConsumerState<OnboardingBody> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = [
      'title 0',
      'title 1',
      'title 2',
    ];
    final desc = [
      'desc 0',
      'desc 1',
      'desc 2',
    ];

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (value) {
              ref.read(onboardingController).setStep(value);
            },
            itemBuilder: (context, index) {
              return OnboardingContent(
                title: title[index],
                desc: desc[index],
                image: 'assets/images/onboarding_$index.png',
              );
            },
          ),
        ),
        Row(
          children: [
            ...List.generate(
              title.length,
              (index) => DotIndicator(
                isActive: ref.watch(onboardingController).step == index,
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              child: const Text('back'),
              onPressed: () {
                if (ref.read(onboardingController).step == 0) return;
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            TextButton(
              child: const Text('next'),
              onPressed: () {
                if (ref.read(onboardingController).step == 2) return;
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            TextButton(
              child: const Text('skip'),
              onPressed: () {
                ref.read(skipOnboardingController).skip();
                context.beamToNamed('/sign_in');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class DotIndicator extends ConsumerWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 5,
      width: 20,
      color: isActive ? NgopayColors.secondary : NgopayColors.darkGray,
    );
  }
}

class OnboardingContent extends ConsumerWidget {
  const OnboardingContent({
    required this.title,
    required this.desc,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: Image.asset(image)),
        Text(title),
        Text(desc),
      ],
    );
  }
}
