import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:agenda_pet/domain/repositories/appointment_repository.dart';

class GetAppointments {
  final AppointmentRepository repository;

  GetAppointments(this.repository);

  Future<List<Appointment>> call() async {
    return await repository.getAppointments();
  }
}
