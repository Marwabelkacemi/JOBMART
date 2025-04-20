import '../../domain/entities/worker_profile.dart';
import '../../domain/entities/portfolio_item.dart';
import '../../domain/repos/worker_repository.dart';
import '../datasources/worker_remote_data_source.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final WorkerRemoteDataSource remoteDataSource;

  WorkerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<WorkerProfile> getWorkerProfile(String userId) {
    return remoteDataSource.getWorkerProfile(userId);
  }

  @override
  Future<void> updateWorkerProfile(WorkerProfile profile) {
    return remoteDataSource.updateWorkerProfile(profile);
  }

  @override
  Future<void> setAvailabilityStatus(String userId, bool isAvailable) {
    return remoteDataSource.setAvailabilityStatus(userId, isAvailable);
  }

  @override
  Future<void> addPortfolioItem(String userId, PortfolioItem item) {
    return remoteDataSource.addPortfolioItem(userId, item);
  }

  @override
  Future<void> updatePortfolioItem(String userId, PortfolioItem item) {
    return remoteDataSource.updatePortfolioItem(userId, item);
  }

  @override
  Future<void> removePortfolioItem(String userId, String portfolioItemId) {
    return remoteDataSource.removePortfolioItem(userId, portfolioItemId);
  }
}
