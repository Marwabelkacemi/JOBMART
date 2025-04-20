import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class DeclineJobRequestUseCase {
  final BookingRepository repository;

  DeclineJobRequestUseCase(this.repository);

  Future<void> call(String bookingId, String workerId) async {
    return repository.declineJobRequest(bookingId, workerId);
  }
}
