import '../../domain/entities/job_entity.dart';


class JobModel extends JobEntity {
  JobModel({
    required super.id,
    required super.clientId,
    required super.workerId,
    required super.description,
    required super.location,
    required super.scheduledDate,
    required super.price,
    required super.status,
    required super.clientCheckIn,
    required super.workerCheckIn,
    required super.clientConfirmedCompletion,
    required super.workerMarkedComplete,
    super.estimatedFinishDate,
    super.workerRating,
    super.clientRating,
    super.clientReview,
    super.workerReview,
  });

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'],
      clientId: map['clientId'],
      workerId: map['workerId'],
      description: map['description'],
      location: map['location'],
      scheduledDate: DateTime.parse(map['scheduledDate']),
      price: (map['price'] ?? 0).toDouble(),
      status: map['status'],
      clientCheckIn: map['clientCheckIn'] ?? false,
      workerCheckIn: map['workerCheckIn'] ?? false,
      clientConfirmedCompletion: map['clientConfirmedCompletion'] ?? false,
      workerMarkedComplete: map['workerMarkedComplete'] ?? false,
      estimatedFinishDate: map['estimatedFinishDate'] != null
          ? DateTime.tryParse(map['estimatedFinishDate'])
          : null,
      workerRating: (map['workerRating'] as num?)?.toDouble(),
      clientRating: (map['clientRating'] as num?)?.toDouble(),
      clientReview: map['clientReview'],
      workerReview: map['workerReview'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientId': clientId,
      'workerId': workerId,
      'description': description,
      'location': location,
      'scheduledDate': scheduledDate.toIso8601String(),
      'price': price,
      'status': status,
      'clientCheckIn': clientCheckIn,
      'workerCheckIn': workerCheckIn,
      'clientConfirmedCompletion': clientConfirmedCompletion,
      'workerMarkedComplete': workerMarkedComplete,
      'estimatedFinishDate': estimatedFinishDate?.toIso8601String(),
      'workerRating': workerRating,
      'clientRating': clientRating,
      'clientReview': clientReview,
      'workerReview': workerReview,
    };
  }

   // Convert JobModel to JobEntity
  JobEntity toEntity() {
    return JobEntity(
      id: id,
      clientId: clientId,
      workerId: workerId,
      description: description,
      location: location,
      scheduledDate: scheduledDate,
      price: price,
      status: status,
      clientCheckIn: clientCheckIn,
      workerCheckIn: workerCheckIn,
      clientConfirmedCompletion: clientConfirmedCompletion,
      workerMarkedComplete: workerMarkedComplete,
      estimatedFinishDate: estimatedFinishDate,
      workerRating: workerRating,
      clientRating: clientRating,
      clientReview: clientReview,
      workerReview: workerReview,
    );
}
}