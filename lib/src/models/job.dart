class Job {
  const Job({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.salaryRange,
    required this.requirementTags,
    required this.title,
    required this.location,
    required this.description,
    required this.jobType,
  });

  final String id;
  final String companyName;
  final String companyLogo;
  final String salaryRange;
  final List<String> requirementTags;
  final String title;
  final String location;
  final String description;
  final String jobType;
}
