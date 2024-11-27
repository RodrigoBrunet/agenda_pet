import 'package:agenda_pet/data/datasources/local_db.dart';
import 'package:agenda_pet/data/models/appointment_model.dart';
import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:agenda_pet/domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final LocalDB localDB;

  AppointmentRepositoryImpl(this.localDB);

  @override
  Future<void> addAppointment(Appointment appointment) async {
    await localDB.insertAppointment(
      AppointmentModel(
        id: appointment.id,
        petId: appointment.petId,
        date: appointment.date,
        service: appointment.service,
      ),
    );
  }

  @override
  Future<List<Appointment>> getAppointments() async {
    final appointments = await localDB.getAppointments();
    return appointments
        .map(
          (model) => Appointment(
            id: model.id,
            petId: model.petId,
            date: model.date,
            service: model.service,
          ),
        )
        .toList();
  }
}
