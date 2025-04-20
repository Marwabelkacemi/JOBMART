import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class ConfirmJobStartUseCase {
  final BookingRepository repository;

  ConfirmJobStartUseCase(this.repository);

  Future<void> call(String bookingId, String workerId) async {
    return repository.confirmJobStart(bookingId, workerId);
  }
}
