import '../entities/worker_profile.dart';
import '../repos/worker_repository.dart';

class UpdateWorkerProfile {
  final WorkerRepository repository;

  UpdateWorkerProfile(this.repository);

  Future<void> call(WorkerProfile profile) {
    return repository.updateWorkerProfile(profile);
  }
}
