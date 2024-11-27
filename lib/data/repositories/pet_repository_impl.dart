import 'package:agenda_pet/data/datasources/local_db.dart';
import 'package:agenda_pet/data/models/pet_model.dart';
import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:agenda_pet/domain/repositories/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  final LocalDB localDB;

  PetRepositoryImpl(this.localDB);

  @override
  Future<void> addPet(Pet pet) async {
    await localDB.insertPet(
      PetModel(id: pet.id, name: pet.name, breed: pet.breed),
    );
  }

  @override
  Future<List<Pet>> getPets() async {
    final pets = await localDB.getPets();
    return pets
        .map((model) => Pet(id: model.id, name: model.name, breed: model.breed))
        .toList();
  }
}
