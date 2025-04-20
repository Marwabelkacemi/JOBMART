import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class UpdateJobStatusUseCase {
  final BookingRepository repository;

  UpdateJobStatusUseCase(this.repository);

  Future<void> call(String bookingId, String status, {DateTime? estimatedFinish}) async {
    return repository.updateJobStatus(bookingId, status);
  }
}
