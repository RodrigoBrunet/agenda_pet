import 'package:agenda_pet/data/models/pet_model.dart';
import 'package:agenda_pet/data/repositories/pet_repository_impl.dart';
import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'pet_repository_impl_test.mocks.mocks.dart';

void main() {
  late PetRepositoryImpl repository;
  late MockLocalDB mockLocalDB;

  setUp(() {
    mockLocalDB = MockLocalDB();
    repository = PetRepositoryImpl(mockLocalDB);
  });

  final pet = Pet(id: 1, name: 'Pipoca', breed: 'Vira lata caramelo');

  group('PetRepositoryImpl', () {
    test('deve adicionar um pet', () async {
      when(mockLocalDB.insertPet(any)).thenAnswer((_) async => 1);

      await repository.addPet(pet);

      verify(mockLocalDB.insertPet(any)).called(1);
    });

    test('deve retornar uma lista de pets', () async {
      when(mockLocalDB.getPets()).thenAnswer(
        (_) async => [
          PetModel(id: 1, name: 'Pipoca', breed: 'Vira lata caramelo'),
          PetModel(id: 2, name: 'Custelinha', breed: 'Vira lata caramelo'),
        ],
      );

      final result = await repository.getPets();

      expect(result, isA<List<Pet>>());
      expect(result.length, 2);
      expect(result[0].name, 'Pipoca');
      expect(result[1].name, 'Custelinha');
    });
  });
}
