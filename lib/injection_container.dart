import 'package:agenda_pet/data/datasources/local_db.dart';
import 'package:agenda_pet/data/repositories/appointment_repository_impl.dart';
import 'package:agenda_pet/data/repositories/pet_repository_impl.dart';
import 'package:agenda_pet/domain/repositories/appointment_repository.dart';
import 'package:agenda_pet/domain/repositories/pet_repository.dart';
import 'package:agenda_pet/domain/usecases/add_appointment.dart';
import 'package:agenda_pet/domain/usecases/add_pet.dart';
import 'package:agenda_pet/domain/usecases/get_appointments.dart';
import 'package:agenda_pet/domain/usecases/get_pets.dart';
import 'package:get_it/get_it.dart';

final it = GetIt.instance;

void setup() {
  // Register LocalDB
  it.registerLazySingleton(() => LocalDB());

  // Register Repositories
  it.registerLazySingleton<PetRepository>(() => PetRepositoryImpl(it()));
  it.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepositoryImpl(it()),
  );

  // Register UseCases
  it.registerLazySingleton(() => AddPet(it()));
  it.registerLazySingleton(() => GetPets(it()));
  it.registerLazySingleton(() => AddAppointment(it()));
  it.registerLazySingleton(() => GetAppointments(it()));
}
