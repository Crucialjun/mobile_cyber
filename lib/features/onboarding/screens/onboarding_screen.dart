import 'package:flutter/material.dart';
import 'package:mobile_cyber/features/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile_cyber/features/onboarding/models/onboardingitem.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Text("onboarding"),
          Expanded(
            child: FutureBuilder<List<Onboardingitem>>(
              future: OnboardingController().loadOnboardingItems(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Text(snapshot.data?[index].title ?? ""));
                      },
                    );
                  }
                }
                return const Text("Loading");
              },
            ),
          )
        ]),
      ),
    );
  }
}
