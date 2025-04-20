import 'package:jobmart/shared/booking/domain/entities/job_entity.dart';
import 'package:jobmart/shared/booking/domain/repositories/booking_repository.dart';
import '../../data/datasources/booking_remote_data_source.dart';
// ignore: unused_import
import '../../data/models/job_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<JobEntity>> getWorkerBookings(String workerId) async {
    final models = await remoteDataSource.getWorkerBookings(workerId);
    return models.map((model) => model.toEntity()).toList(); // Map model to entity
  }

  @override
  Future<void> acceptJobRequest(String jobId, String workerId) {
    return remoteDataSource.acceptJobRequest(jobId, workerId);
  }

  @override
  Future<void> declineJobRequest(String jobId, String workerId) {
    return remoteDataSource.declineJobRequest(jobId, workerId);
  }

  @override
  Future<void> updateAvailability(String workerId, bool isAvailable) {
    return remoteDataSource.updateAvailability(workerId, isAvailable);
  }

  @override
  Future<void> confirmJobStart(String bookingId, String workerId) {
    return remoteDataSource.confirmJobStart(bookingId, workerId);
  }

  @override
  Future<void> updateJobStatus(String jobId, String status) {
    return remoteDataSource.updateJobStatus(jobId, status);
  }

  @override
  Future<void> updateEstimatedFinishDate(String jobId, DateTime newDate) {
    return remoteDataSource.updateEstimatedFinishDate(jobId, newDate);
  }

  @override
  Future<void> markJobAsComplete(String jobId) {
    return remoteDataSource.markJobAsComplete(jobId);
  }

  @override
  Future<void> confirmJobCompletion(String jobId) {
    return remoteDataSource.confirmJobCompletion(jobId);
  }

  @override
  Future<void> rateAndReview({
    required String jobId,
    required bool isWorker,
    required double rating,
    required String review,
  }) {
    return remoteDataSource.rateAndReview(
      jobId: jobId,
      isWorker: isWorker,
      rating: rating,
      review: review,
    );
  }

  @override
  Future<void> checkIn(String bookingId, bool isWorker) {
    return remoteDataSource.checkIn(bookingId, isWorker);
  }
}
