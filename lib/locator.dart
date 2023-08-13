import 'package:get_it/get_it.dart';
import 'package:mobile_cyber/services/firebase_auth/firebase_auth_service.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator
      .registerLazySingleton<IFirebaseAuthService>(() => FirebaseAuthService());
}
