import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/utils/constants.dart';
import 'package:mobile_cyber/features/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile_cyber/features/onboarding/widgets/onboarding_pageview_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  static const String routeName = "onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  List _onboardingItems = [];
  @override
  void initState() {
    loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (currentpage) {
                ref
                    .read(onboardingControllerProvider)
                    .updateCurrentPage(currentpage);
                print(currentpage);
                print(_onboardingItems.length - 1);
              },
              controller: ref.watch(onboardingControllerProvider).controller,
              scrollDirection: Axis.horizontal,
              itemCount: _onboardingItems.length,
              itemBuilder: (context, index) {
                return OnboardingPageviewItem(item: _onboardingItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SignUpScreen.routeName, (route) => false);
                  },
                  child: const Text(
                    "SKIP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SmoothPageIndicator(
                    effect: const SlideEffect(activeDotColor: appMainColor),
                    controller:
                        ref.watch(onboardingControllerProvider).controller,
                    count: _onboardingItems.length),
                ref.watch(onboardingControllerProvider).currentPage ==
                        _onboardingItems.length - 1
                    ? InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              SignUpScreen.routeName, (route) => false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          ref
                              .read(onboardingControllerProvider)
                              .moveNext(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      )
              ],
            ),
          )
        ]),
      ),
    );
  }

  void loadItems() async {
    _onboardingItems = await ref
        .read(onboardingControllerProvider)
        .loadOnboardingItems(context);
    setState(() {});
  }
}
