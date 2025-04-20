import '../../entities/portfolio_item.dart';
import '../../repos/worker_repository.dart';

class UpdatePortfolioItem {
  final WorkerRepository repository;

  UpdatePortfolioItem(this.repository);

  Future<void> call(String userId, PortfolioItem item) {
    return repository.updatePortfolioItem(userId, item);
  }
}
