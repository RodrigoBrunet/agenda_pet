import 'package:agenda_pet/domain/entities/pet.dart';

abstract class PetRepository {
  Future<void> addPet(Pet pet);
  Future<List<Pet>> getPets();
}
