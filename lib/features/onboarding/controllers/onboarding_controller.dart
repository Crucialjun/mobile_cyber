import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/features/auth/screens/sign_up_screen.dart';
import 'package:mobile_cyber/features/onboarding/models/onboardingitem.dart';

class OnboardingController extends ChangeNotifier {
 
  List<Onboardingitem> _onboardingItems = [];

  List<Onboardingitem> get onboardingItems => _onboardingItems;

  int _currentPage = 0;

  int get currentPage => _currentPage;

  final PageController _controller = PageController();

  PageController get controller => _controller;

  Future<List<Onboardingitem>> loadOnboardingItems(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/onboarding_items.json");
    final json = jsonDecode(data);

    _onboardingItems = List<Onboardingitem>.from(
        json.map((model) => Onboardingitem.fromJson(model)));

    notifyListeners();
    return _onboardingItems;
  }

  void moveNext(BuildContext context) {
    if (controller.page! < _onboardingItems.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, SignUpScreen.routeName, (route) => false);
    }
  }

  void updateCurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}

final onboardingControllerProvider = ChangeNotifierProvider((ref) {
  return OnboardingController();
});
