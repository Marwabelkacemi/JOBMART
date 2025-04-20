import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';
import 'package:jobmart/shared/booking/domain/entities/job_entity.dart';

class GetWorkerBookingsUseCase {
  final BookingRepository repository;

  GetWorkerBookingsUseCase(this.repository);

  Future<List<JobEntity>> call(String workerId) async {
    return repository.getWorkerBookings(workerId);
  }
}
