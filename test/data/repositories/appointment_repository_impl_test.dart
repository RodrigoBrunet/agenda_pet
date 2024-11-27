import 'package:agenda_pet/data/models/appointment_model.dart';
import 'package:agenda_pet/data/repositories/appointment_repository_impl.dart';
import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'appointment_repository_impl_test_mocks.mocks.dart';

void main() {
  late AppointmentRepositoryImpl repository;
  late MockLocalDB mockLocalDB;

  setUp(() {
    mockLocalDB = MockLocalDB();
    repository = AppointmentRepositoryImpl(mockLocalDB);
  });

  final appointment = Appointment(
    id: 1,
    petId: 1,
    date: DateTime.parse('2024-01-01'),
    service: 'Banho',
  );

  group('AppointmentRepositoryImpl', () {
    test('deve adicionar um agendamento', () async {
      when(mockLocalDB.insertAppointment(any)).thenAnswer((_) async => 1);

      await repository.addAppointment(appointment);

      verify(mockLocalDB.insertAppointment(any)).called(1);
    });

    test('deve retornar uma lista de agendamentos', () async {
      when(mockLocalDB.getAppointments()).thenAnswer(
        (_) async => [
          AppointmentModel(
            id: 1,
            petId: 1,
            date: DateTime.parse('2024-01-01'),
            service: 'Banho',
          ),
          AppointmentModel(
            id: 2,
            petId: 2,
            date: DateTime.parse('2024-01-01'),
            service: 'Tosa',
          ),
        ],
      );
      final result = await repository.getAppointments();
      expect(result, isA<List<Appointment>>());
      expect(result.length, 2);
      expect(result[0].service, 'Banho');
      expect(result[1].service, 'Tosa');
    });
  });
}
