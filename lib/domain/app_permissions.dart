import 'entities/role.dart';

class Permissions {
  static bool canCreateClasses(List<Role> roles) {
    return roles.contains(Role.classRep) || roles.contains(Role.lecturer);
  }

  static bool canBookVenues(List<Role> roles) {
    return roles.contains(Role.classRep) || roles.contains(Role.lecturer);
  }

  static bool canManageUsers(List<Role> roles) {
    return roles.contains(Role.admin);
  }

  // the others to be added later (patron and club leaders)
  static bool canScheduleEvents(List<Role> roles) {
    return roles.contains(Role.facultyRep) || roles.contains(Role.lecturer) || roles.contains(Role.admin);
  }
}