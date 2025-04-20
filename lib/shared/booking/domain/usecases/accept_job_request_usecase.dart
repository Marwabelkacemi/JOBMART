import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class AcceptJobRequestUseCase {
  final BookingRepository repository;

  AcceptJobRequestUseCase(this.repository);

  Future<void> call(String bookingId, String workerId) async {
    return repository.acceptJobRequest(bookingId, workerId);
  }
}
