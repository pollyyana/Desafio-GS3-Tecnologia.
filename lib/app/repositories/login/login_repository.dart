import 'package:gs3_tecnologia/app/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel?> getUserByCpf(String cpf);
}
