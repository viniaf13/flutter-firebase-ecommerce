abstract class IUserRepository {
  Future<bool> authenticateUser(String email, String password);
}
