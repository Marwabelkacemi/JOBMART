import '../entities/worker_profile.dart';
import '../repos/worker_repository.dart';

class GetWorkerProfile {
  final WorkerRepository repository;

  GetWorkerProfile(this.repository);

  Future<WorkerProfile> call(String userId) {
    return repository.getWorkerProfile(userId);
  }
}
