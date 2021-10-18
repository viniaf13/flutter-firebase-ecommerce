import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_ecommerce/repositories/interfaces/i_user_repository.dart';
import 'package:flutter_firebase_ecommerce/utils/snackbar_utils.dart';

class UserRepository implements IUserRepository {
  @override
  Future<bool> authenticateUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        SnackbarUtils.showErrorSnackbar(
            title: 'Erro de autenticação:',
            message: 'Não foi encontrado um usuário para esse email.');
      } else if (e.code == 'wrong-password') {
        SnackbarUtils.showErrorSnackbar(
            title: 'Erro de autenticação:',
            message: 'A senha informada está incorreta.');
      } else {
        SnackbarUtils.showErrorSnackbar(
            title: 'Erro de autenticação:',
            message: 'Ocorreu um problema, tente novamente mais tarde.');
      }
      return false;
    }
  }
}
