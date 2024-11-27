import 'package:agenda_pet/domain/entities/appointment.dart';

abstract class AppointmentRepository {
  Future<void> addAppointment(Appointment appointment);
  Future<List<Appointment>> getAppointments();
}
