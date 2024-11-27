import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:agenda_pet/domain/repositories/pet_repository.dart';

class AddPet {
  final PetRepository repository;

  AddPet(this.repository);

  Future<void> call(Pet pet) async {
    await repository.addPet(pet);
  }
}
