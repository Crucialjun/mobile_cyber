import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_cyber/features/onboarding/models/onboardingitem.dart';

class OnboardingPageviewItem extends StatelessWidget {
  final Onboardingitem item;
  const OnboardingPageviewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(child: SvgPicture.asset("assets/svgs/${item.imageName}")),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          item.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onBackground),
        )
      ]),
    );
  }
}
