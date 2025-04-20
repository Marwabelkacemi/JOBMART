import 'package:cloud_firestore/cloud_firestore.dart';

class JobEntity {
  final String id;
  final String clientId;
  final String workerId;
  final String description;
  final String location;
  final DateTime scheduledDate;
  final double price;
  final String status; // pending, accepted, in-progress, completed, paused, delayed
  final bool clientCheckIn;
  final bool workerCheckIn;
  final bool clientConfirmedCompletion;
  final bool workerMarkedComplete;
  final DateTime? estimatedFinishDate;
  final double? workerRating;
  final double? clientRating;
  final String? clientReview;
  final String? workerReview;

  JobEntity({
    required this.id,
    required this.clientId,
    required this.workerId,
    required this.description,
    required this.location,
    required this.scheduledDate,
    required this.price,
    required this.status,
    required this.clientCheckIn,
    required this.workerCheckIn,
    required this.clientConfirmedCompletion,
    required this.workerMarkedComplete,
    this.estimatedFinishDate,
    this.workerRating,
    this.clientRating,
    this.clientReview,
    this.workerReview,
  });

  factory JobEntity.fromMap(Map<String, dynamic> map, String id) {
    return JobEntity(
      id: id,
      clientId: map['clientId'] ?? '',
      workerId: map['workerId'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      scheduledDate: (map['scheduledDate'] as Timestamp).toDate(),
      price: (map['price'] as num).toDouble(),
      status: map['status'] ?? 'pending',
      clientCheckIn: map['clientCheckIn'] ?? false,
      workerCheckIn: map['workerCheckIn'] ?? false,
      clientConfirmedCompletion: map['clientConfirmedCompletion'] ?? false,
      workerMarkedComplete: map['workerMarkedComplete'] ?? false,
      estimatedFinishDate: map['estimatedFinishDate'] != null
          ? (map['estimatedFinishDate'] as Timestamp).toDate()
          : null,
      workerRating: map['workerRating'] != null
          ? (map['workerRating'] as num).toDouble()
          : null,
      clientRating: map['clientRating'] != null
          ? (map['clientRating'] as num).toDouble()
          : null,
      clientReview: map['clientReview'],
      workerReview: map['workerReview'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'workerId': workerId,
      'description': description,
      'location': location,
      'scheduledDate': Timestamp.fromDate(scheduledDate),
      'price': price,
      'status': status,
      'clientCheckIn': clientCheckIn,
      'workerCheckIn': workerCheckIn,
      'clientConfirmedCompletion': clientConfirmedCompletion,
      'workerMarkedComplete': workerMarkedComplete,
      'estimatedFinishDate': estimatedFinishDate != null
          ? Timestamp.fromDate(estimatedFinishDate!)
          : null,
      'workerRating': workerRating,
      'clientRating': clientRating,
      'clientReview': clientReview,
      'workerReview': workerReview,
    };
  }
}
