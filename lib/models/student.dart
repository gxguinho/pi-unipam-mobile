class Student {
  final String firstName;
  final String lastName;
  final int totalClasses;
  final int participation;

  const Student(
      {required this.firstName,
      required this.lastName,
      required this.totalClasses,
      required this.participation});

  Student copy(
          {String? firstName,
          String? lastName,
          int? totalClasses,
          int? participation}) =>
      Student(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        totalClasses: totalClasses ?? this.totalClasses,
        participation: participation ?? this.participation,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Student &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          totalClasses == other.totalClasses &&
          participation == other.participation;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      totalClasses.hashCode ^
      participation.hashCode;
}
