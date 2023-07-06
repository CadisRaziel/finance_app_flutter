
import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:finance/view/sign_up/sign_up_controller.dart';
import 'package:mocktail/mocktail.dart';

//extendemos de mock e implementamos a interface real que queremos testar
class MockFirebaseAuthService extends Mock implements AuthService {}

class MockSecureStorage extends Mock implements SecureStorage {}
