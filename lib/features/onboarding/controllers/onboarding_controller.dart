import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_cyber/features/onboarding/models/onboardingitem.dart';

class OnboardingController {
  Future<List<Onboardingitem>> loadOnboardingItems(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/onboarding_items.json");
    final json = jsonDecode(data);

    List<Onboardingitem> onboardingItems = List<Onboardingitem>.from(
        json.map((model) => Onboardingitem.fromJson(model)));

    return onboardingItems;
  }
}
