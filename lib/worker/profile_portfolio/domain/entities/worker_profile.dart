import 'portfolio_item.dart';
enum WorkerMode { serviceProvider, productSeller }
class WorkerProfile {
  final String id;
  final String userId; // reference to User entity
  final String profession; // e.g., plumbing, painting
  final String bio;
  final double pricePerHour;
  final double pricePerDay;
  final double pricePerProject;
  final List<PortfolioItem> portfolioUrls; // image or video URLs
  final bool isAvailable;
  final WorkerMode mode;

  const WorkerProfile({
    required this.id,
    required this.userId,
    required this.profession,
    required this.bio,
    required this.pricePerHour,
    required this.pricePerDay,
    required this.pricePerProject,
    required this.portfolioUrls,
    required this.isAvailable,
    required this.mode,
  });
}
