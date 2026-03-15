import 'package:flutter/foundation.dart';

import '../data/mock_data.dart';
import '../models/candidate.dart';
import '../models/job.dart';
import '../models/match_record.dart';
import '../models/message.dart';
import '../models/story.dart';
import '../models/user_preferences.dart';

enum UserRole { candidate, employer }

class HastiqState extends ChangeNotifier {
  UserRole? role;

  final List<Job> jobs = List.of(kMockJobs);
  final List<Job> savedJobs = [];
  final List<Job> appliedJobs = [];
  final List<MatchRecord> matches = List.of(kInitialMatches);
  final List<Message> messages = List.of(kInitialMessages);
  final List<Story> stories = List.of(kMockStories);
  final List<Candidate> candidates = List.of(kMockCandidates);

  Candidate profile = kMockCandidates.first;
  UserPreferences preferences = kInitialPreferences;

  void selectRole(UserRole nextRole) {
    role = nextRole;
    notifyListeners();
  }

  Job? get nextJob => jobs.isEmpty ? null : jobs.first;
  Candidate? get nextCandidate => candidates.isEmpty ? null : candidates.first;

  void skipJob(Job job) {
    jobs.remove(job);
    notifyListeners();
  }

  void saveJob(Job job) {
    jobs.remove(job);
    savedJobs.add(job);
    notifyListeners();
  }

  bool applyJob(Job job) {
    jobs.remove(job);
    appliedJobs.add(job);
    final isMatched = appliedJobs.length.isEven;
    if (isMatched) {
      matches.insert(
        0,
        MatchRecord(
          jobId: job.id,
          company: job.companyName,
          lastMessage: 'New match created. Say hello!',
        ),
      );
    }
    notifyListeners();
    return isMatched;
  }

  void sendMessage(String text, {String sender = 'You'}) {
    messages.add(Message(sender: sender, body: text, time: DateTime.now()));
    if (matches.isNotEmpty) {
      final head = matches.first;
      matches[0] = MatchRecord(
        jobId: head.jobId,
        company: head.company,
        lastMessage: text,
      );
    }
    notifyListeners();
  }

  void reviewCandidate(bool accepted) {
    if (candidates.isEmpty) return;
    candidates.removeAt(0);
    notifyListeners();
  }

  void updateProfile({
    required String jobTitle,
    required String bio,
    required String portfolio,
    required List<String> skills,
  }) {
    profile = Candidate(
      id: profile.id,
      name: profile.name,
      jobTitle: jobTitle,
      skills: skills,
      educationSummary: profile.educationSummary,
      bio: bio,
      portfolioLink: portfolio,
    );
    notifyListeners();
  }

  void updatePreferences(UserPreferences next) {
    preferences = next;
    notifyListeners();
  }
}
