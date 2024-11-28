import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:agenda_pet/domain/usecases/add_appointment.dart';
import 'package:agenda_pet/domain/usecases/get_appointments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AddAppointment addAppointment;
  final GetAppointments getAppointments;

  AppointmentBloc({required this.addAppointment, required this.getAppointments})
    : super(AppointmentInitial());

  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    if (event is AddAppointmentEvent) {
      yield AppointmentLoading();
      await addAppointment(event.appointment);
      yield AppointmentAdded();
      final appointments = await getAppointments();
      yield AppointmentsLoaded(appointments: appointments);
    } else if (event is GetAppointmentsEvent) {
      yield AppointmentLoading();
      final appointments = await getAppointments();
      yield AppointmentsLoaded(appointments: appointments);
    }
  }
}

abstract class AppointmentEvent {}

class AddAppointmentEvent extends AppointmentEvent {
  final Appointment appointment;

  AddAppointmentEvent(this.appointment);
}

class GetAppointmentsEvent extends AppointmentEvent {}

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentAdded extends AppointmentState {}

class AppointmentsLoaded extends AppointmentState {
  final List<Appointment> appointments;

  AppointmentsLoaded({required this.appointments});
}