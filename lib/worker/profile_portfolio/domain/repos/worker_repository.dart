import '../entities/worker_profile.dart';
import '../entities/portfolio_item.dart';

abstract class WorkerRepository {
  Future<WorkerProfile> getWorkerProfile(String userId);
  Future<void> updateWorkerProfile(WorkerProfile profile);
  Future<void> setAvailabilityStatus(String userId, bool isAvailable);

   // Portfolio-specific methods
  Future<void> addPortfolioItem(String userId, PortfolioItem item);
  Future<void> updatePortfolioItem(String userId, PortfolioItem item);
  Future<void> removePortfolioItem(String userId, String portfolioItemId);
}
