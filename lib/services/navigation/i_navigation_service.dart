abstract class INavigationService {
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments});
  Future<dynamic> pushNamed(String routeName, {Object? arguments});
}
