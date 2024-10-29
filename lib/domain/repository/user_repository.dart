import '../models/user_model.dart';

abstract class UserRepository {
  Future<User> getUserByID(String userID);
  Future<List<User>> getUsersByAcademicCourse(String academicDetailID);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String userID);
  // TODO: Implement CRUD
}