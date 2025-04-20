import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<JobModel>> getWorkerBookings(String workerId);
  Future<void> acceptJobRequest(String jobId, String workerId);
  Future<void> declineJobRequest(String jobId, String workerId);
  Future<void> updateAvailability(String workerId, bool isAvailable);
  Future<void> confirmJobStart(String bookingId, String workerId);
  Future<void> updateJobStatus(String jobId, String status);
  Future<void> updateEstimatedFinishDate(String jobId, DateTime newDate);
  Future<void> markJobAsComplete(String jobId);
  Future<void> confirmJobCompletion(String jobId);
  Future<void> checkIn(String jobId, bool isWorker);
  Future<void> rateAndReview({
    required String jobId,
    required bool isWorker,
    required double rating,
    required String review,
  });
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final FirebaseFirestore firestore;

  BookingRemoteDataSourceImpl({required this.firestore});

  /// Fetch bookings for a given worker
  @override
  Future<List<JobModel>> getWorkerBookings(String workerId) async {
    final snapshot = await firestore
        .collection('bookings')
        .where('workerId', isEqualTo: workerId)
        .get();

    return snapshot.docs
        .map((doc) => JobModel.fromMap({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Accept job by worker and update job status
  @override
  Future<void> acceptJobRequest(String jobId, String workerId) async {
    await firestore.collection('bookings').doc(jobId).update({
      'status': 'accepted',
    });
  }

  /// Decline job request
  @override
  Future<void> declineJobRequest(String jobId, String workerId) async {
    await firestore.collection('bookings').doc(jobId).update({
      'status': 'declined',
    });
  }

  /// Update worker's availability flag
  @override
  Future<void> updateAvailability(String workerId, bool isAvailable) async {
    await firestore.collection('users').doc(workerId).update({
      'isAvailable': isAvailable,
    });
  }

  /// Confirm job start by either party
  @override
  Future<void> confirmJobStart(String bookingId, String workerId) async {
    await firestore.collection('bookings').doc(bookingId).update({
      'workerCheckIn': true,
    });
  }

  /// Update the job's current status (e.g., in-progress, paused)
  @override
  Future<void> updateJobStatus(String jobId, String status) async {
    await firestore.collection('bookings').doc(jobId).update({
      'status': status,
    });
  }

  /// Update the expected finish date for a job
  @override
  Future<void> updateEstimatedFinishDate(String jobId, DateTime newDate) async {
    await firestore.collection('bookings').doc(jobId).update({
      'estimatedFinishDate': newDate.toIso8601String(),
    });
  }

  /// Worker marks job as completed
  @override
  Future<void> markJobAsComplete(String jobId) async {
    await firestore.collection('bookings').doc(jobId).update({
      'workerMarkedComplete': true,
    });
  }

  /// Client confirms the completion
  @override
  Future<void> confirmJobCompletion(String jobId) async {
    await firestore.collection('bookings').doc(jobId).update({
      'clientConfirmedCompletion': true,
    });
  }

  /// Leave rating and review for a job
  @override
  Future<void> rateAndReview({
    required String jobId,
    required bool isWorker,
    required double rating,
    required String review,
  }) async {
    final updateData = isWorker
        ? {
            'workerRating': rating,
            'workerReview': review,
          }
        : {
            'clientRating': rating,
            'clientReview': review,
          };

    await firestore.collection('bookings').doc(jobId).update(updateData);
  }

  
  /// Worker or client checks in
  @override
  Future<void> checkIn(String jobId, bool isWorker) async {
    // Determine which field to update based on whether it's a worker or client
    final checkInField = isWorker ? 'workerCheckIn' : 'clientCheckIn';

    // Update the check-in field in Firestore
    await firestore.collection('bookings').doc(jobId).update({
      checkInField: true,
    });
  }
}
