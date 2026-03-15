class Candidate {
  const Candidate({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.skills,
    required this.educationSummary,
    required this.bio,
    required this.portfolioLink,
  });

  final String id;
  final String name;
  final String jobTitle;
  final List<String> skills;
  final String educationSummary;
  final String bio;
  final String portfolioLink;
}
