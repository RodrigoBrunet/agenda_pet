import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:agenda_pet/domain/repositories/appointment_repository.dart';

class AddAppointment {
  final AppointmentRepository repository;

  AddAppointment(this.repository);

  Future<void> call(Appointment appointment) async {
    await repository.addAppointment(appointment);
  }
}
