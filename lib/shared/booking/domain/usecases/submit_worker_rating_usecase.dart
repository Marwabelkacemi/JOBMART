import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';

class SubmitWorkerRatingUseCase {
  final BookingRepository repository;

  SubmitWorkerRatingUseCase(this.repository);

  Future<void> call(String bookingId, double rating, String review) async {
    return repository.rateAndReview(
      jobId: bookingId,
      isWorker: true,
      rating: rating,
      review: review,
    );
  }
}
