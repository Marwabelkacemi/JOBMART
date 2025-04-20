import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class MarkJobAsDoneUseCase {
  final BookingRepository repository;

  MarkJobAsDoneUseCase(this.repository);

  Future<void> call(String bookingId, String workerId) async {
    return repository.markJobAsComplete(bookingId);
  }
}
