import 'package:gs3_tecnologia/app/models/user_model.dart';

abstract class LoginService {
  Future<UserModel?> login(String cpf, String password);
  UserModel? get currentUser;
  Future<void> logout();
}
