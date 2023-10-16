import 'package:get_it/get_it.dart';
import 'package:mobile_cyber/features/auth/repository/auth_repository.dart';
import 'package:mobile_cyber/features/auth/repository/i_auth_repository.dart';
import 'package:mobile_cyber/services/database_service/database_service.dart';
import 'package:mobile_cyber/services/database_service/i_database_service.dart';
import 'package:mobile_cyber/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:mobile_cyber/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:mobile_cyber/services/firebase_auth/firebase_auth_service.dart';
import 'package:mobile_cyber/services/firebase_auth/i_firebase_auth_service.dart';
import 'package:mobile_cyber/services/navigation/i_navigation_service.dart';
import 'package:mobile_cyber/services/navigation/navigation_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator
      .registerLazySingleton<IFirebaseAuthService>(() => FirebaseAuthService());
  locator.registerLazySingleton<INavigationService>(() => NavigationService());

  locator.registerLazySingleton<IDatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<IDialogAndSheetService>(
      () => DialogAndSheetService());
}
