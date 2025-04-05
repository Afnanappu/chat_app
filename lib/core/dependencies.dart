import 'package:chat_app/feature/auth/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// Registers all singleton dependencies with the GetIt service locator.
///
/// Called by the main function to set up all dependencies.
void setupDependencies() {
  getIt.registerLazySingleton(() => AuthFirebaseService());
}
