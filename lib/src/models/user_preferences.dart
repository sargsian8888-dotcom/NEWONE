class UserPreferences {
  const UserPreferences({
    required this.location,
    required this.salaryThreshold,
    required this.jobType,
    required this.notifyMatches,
    required this.notifyMessages,
  });

  final String location;
  final int salaryThreshold;
  final String jobType;
  final bool notifyMatches;
  final bool notifyMessages;

  UserPreferences copyWith({
    String? location,
    int? salaryThreshold,
    String? jobType,
    bool? notifyMatches,
    bool? notifyMessages,
  }) {
    return UserPreferences(
      location: location ?? this.location,
      salaryThreshold: salaryThreshold ?? this.salaryThreshold,
      jobType: jobType ?? this.jobType,
      notifyMatches: notifyMatches ?? this.notifyMatches,
      notifyMessages: notifyMessages ?? this.notifyMessages,
    );
  }
}
