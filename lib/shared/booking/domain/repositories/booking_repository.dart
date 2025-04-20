
import '../entities/job_entity.dart';


abstract class BookingRepository {
  Future<List<JobEntity>> getWorkerBookings(String workerId);
  Future<void> acceptJobRequest(String jobId, String workerId);
  Future<void> declineJobRequest(String jobId, String workerId);
  Future<void> updateAvailability(String workerId, bool isAvailable);
  Future<void> checkIn(String jobId, bool isWorker);
  Future<void> updateJobStatus(String jobId, String status);
  Future<void> updateEstimatedFinishDate(String jobId, DateTime newDate);
  Future<void> markJobAsComplete(String jobId);
  Future<void> confirmJobCompletion(String jobId);
  Future<void> confirmJobStart(String bookingId, String workerId);
  Future<void> rateAndReview({
    required String jobId,
    required bool isWorker,
    required double rating,
    required String review,
  });
}
// Compare this snippet from lib/shared/booking/data/datasources/booking_remote_data_source.dart: