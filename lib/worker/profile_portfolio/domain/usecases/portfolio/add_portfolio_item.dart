import '../../entities/portfolio_item.dart';
import '../../repos/worker_repository.dart';

class AddPortfolioItem {
  final WorkerRepository repository;

  AddPortfolioItem(this.repository);

  Future<void> call(String userId, PortfolioItem item) {
    return repository.addPortfolioItem(userId, item);
  }
}
