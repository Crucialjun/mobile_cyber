import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_cyber/app.dart';

import 'package:mobile_cyber/firebase_options.dart';
import 'package:mobile_cyber/locator.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setUpLocator();
  runApp(const ProviderScope(child: MyApp()));
}


