import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:agenda_pet/domain/repositories/pet_repository.dart';

class GetPets {
  final PetRepository repository;

  GetPets(this.repository);

  Future<List<Pet>> call() async {
    return await repository.getPets();
  }
}
