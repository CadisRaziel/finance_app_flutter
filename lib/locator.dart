import 'package:finance/repositories/transaction_repository.dart';
import 'package:finance/repositories/transaction_repository_impl.dart';
import 'package:finance/services/auth_service.dart';
import 'package:finance/services/firebase_auth_service.dart';
import 'package:finance/services/mock_auth_service_impl.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:finance/view/home/home_controller.dart';
import 'package:finance/view/sign_in/sign_in_controller.dart';
import 'package:finance/view/sign_up/sign_up_controller.dart';
import 'package:finance/view/splash/splash_controller.dart';
import 'package:get_it/get_it.dart';

//aqui tera os seguintes objetos -> Services / Controllers
//!Ao invés de injetar a dependencia na tela, nos injetamos aqui e passamos só uma variavel natela

final locator = GetIt.instance;

void setUpDependencies() {
  //passo 1º a classe abstrata e depois a classe de implementação da abstrata
  //registerLazySingleton -> criar o objeto apenas quando for necessario e não desde o inicio da aplicação
  locator.registerLazySingleton<AuthService>(() => (FirebaseAuthService()));

//como eu deixei o construtor do SecureStorage const é só eu criar um registerFactory
  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  //registerFactory -> cria um objeto novo toda vez que chamar o 'locator.get()'
  //sempre que precisarmos de um novo objeto do tipo SignInController nos chamamos ele mesmo
  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(() =>
      SignUpController(locator.get<AuthService>(), const SecureStorage()));

  locator.registerFactory<TransactionRepository>(
      () => TransactionRepositoryImpl());

  locator.registerLazySingleton<HomeController>(
      () => HomeController(locator.get<TransactionRepository>()));
}
