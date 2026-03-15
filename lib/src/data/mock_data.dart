import '../models/candidate.dart';
import '../models/job.dart';
import '../models/match_record.dart';
import '../models/message.dart';
import '../models/story.dart';
import '../models/user_preferences.dart';

const List<Job> kMockJobs = [
  Job(
    id: 'j1',
    companyName: 'Picsart Armenia',
    companyLogo: 'PA',
    salaryRange: '\$2400 - \$3000',
    requirementTags: ['Remote', 'Senior', 'Flutter'],
    title: 'Senior Flutter Engineer',
    location: 'Yerevan, AM',
    description: 'Lead mobile product delivery and mentor engineers.',
    jobType: 'Full-time',
  ),
  Job(
    id: 'j2',
    companyName: 'Team Telecom',
    companyLogo: 'TT',
    salaryRange: '\$1800 - \$2500',
    requirementTags: ['Hybrid', 'React', 'Mid-level'],
    title: 'Frontend Developer',
    location: 'Yerevan, AM',
    description: 'Ship modern interfaces for telecom digital products.',
    jobType: 'Full-time',
  ),
  Job(
    id: 'j3',
    companyName: 'Krisp',
    companyLogo: 'KR',
    salaryRange: '\$2700 - \$3600',
    requirementTags: ['On-site', 'AI', 'Senior'],
    title: 'ML Product Engineer',
    location: 'Yerevan, AM',
    description: 'Build AI-powered experiences for global communication.',
    jobType: 'Full-time',
  ),
  Job(
    id: 'j4',
    companyName: 'Renderforest',
    companyLogo: 'RF',
    salaryRange: '\$1500 - \$2100',
    requirementTags: ['Remote', 'UI', 'Junior'],
    title: 'UI Engineer',
    location: 'Gyumri, AM',
    description: 'Craft performant design-driven UI workflows.',
    jobType: 'Contract',
  ),
];

const List<Story> kMockStories = [
  Story(
    id: 's1',
    companyName: 'Picsart',
    thumbnailLabel: 'Culture Tour',
    videoCaption: 'Meet our design + mobile squads.',
  ),
  Story(
    id: 's2',
    companyName: 'Team',
    thumbnailLabel: 'Day in life',
    videoCaption: 'Follow an engineer through sprint day.',
  ),
  Story(
    id: 's3',
    companyName: 'Krisp',
    thumbnailLabel: 'Meet the team',
    videoCaption: 'How AI researchers and PMs collaborate.',
  ),
];

const List<Candidate> kMockCandidates = [
  Candidate(
    id: 'c1',
    name: 'Lilit Harutyunyan',
    jobTitle: 'Mobile Developer',
    skills: ['Flutter', 'Firebase', 'UI/UX'],
    educationSummary: 'BA in Computer Science, AUA',
    bio: 'I build polished product experiences with Flutter.',
    portfolioLink: 'https://portfolio.example/lilit',
  ),
  Candidate(
    id: 'c2',
    name: 'Arman Petrosyan',
    jobTitle: 'Frontend Engineer',
    skills: ['React', 'TypeScript', 'Design Systems'],
    educationSummary: 'BS in Software Engineering, NPUA',
    bio: 'Frontend engineer focused on accessibility and UX.',
    portfolioLink: 'https://portfolio.example/arman',
  ),
];

const List<MatchRecord> kInitialMatches = [
  MatchRecord(
    jobId: 'j2',
    company: 'Team Telecom',
    lastMessage: 'Can we schedule an interview tomorrow?',
  ),
];

final List<Message> kInitialMessages = [
  Message(
    sender: 'Team Telecom',
    body: 'Hi! Thanks for applying. We liked your profile.',
    time: DateTime(2026, 3, 15, 12, 30),
  ),
];

const UserPreferences kInitialPreferences = UserPreferences(
  location: 'Yerevan',
  salaryThreshold: 1800,
  jobType: 'Full-time',
  notifyMatches: true,
  notifyMessages: true,
);
