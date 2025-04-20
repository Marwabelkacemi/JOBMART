import '../../repos/worker_repository.dart';

class RemovePortfolioItem {
  final WorkerRepository repository;

  RemovePortfolioItem(this.repository);

  Future<void> call(String userId, String portfolioItemId) {
    return repository.removePortfolioItem(userId, portfolioItemId);
  }
}
