import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/common/controllers/common_use_controller.dart';
import 'package:mobile_cyber/common/models/user_settings.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile_cyber/features/onboarding/widgets/onboarding_pageview_item.dart';
import 'package:mobile_cyber/utils/app_strings.dart';
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
      appBar: AppBar(),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (currentPage) {
                ref
                    .read(onboardingControllerProvider)
                    .updateCurrentPage(currentPage);
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
                  child: Text(
                    AppStrings.skip.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SmoothPageIndicator(
                    effect: SlideEffect(
                        activeDotColor: Theme.of(context).primaryColor),
                    controller:
                        ref.watch(onboardingControllerProvider).controller,
                    count: _onboardingItems.length),
                ref.watch(onboardingControllerProvider).currentPage ==
                        _onboardingItems.length - 1
                    ? InkWell(
                        onTap: () async {
                          await ref.read(commonUseController).saveUserSettings(
                              const UserSettings()
                                  .copyWith(isFirstTime: false));
                          Navigator.pushNamedAndRemoveUntil(context,
                              SignUpScreen.routeName, (route) => false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.getStarted,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.next.toUpperCase(),
                            style: const TextStyle(
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
