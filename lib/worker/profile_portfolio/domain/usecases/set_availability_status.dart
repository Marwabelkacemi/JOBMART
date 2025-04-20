import '../repos/worker_repository.dart';

class SetAvailabilityStatus {
  final WorkerRepository repository;

  SetAvailabilityStatus(this.repository);

  Future<void> call(String userId, bool isAvailable) {
    return repository.setAvailabilityStatus(userId, isAvailable);
  }
}
