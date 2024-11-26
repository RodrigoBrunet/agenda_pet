import 'package:agenda_pet/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel({
    required super.id,
    required super.petId,
    required super.date,
    required super.service,
  });

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'],
      petId: map['pet_id'],
      date: DateTime.parse(map['date']),
      service: map['service'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pet_id': petId,
      'date': date.toIso8601String(),
      'service': service,
    };
  }
}
