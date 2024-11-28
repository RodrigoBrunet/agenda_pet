import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:agenda_pet/domain/usecases/add_pet.dart';
import 'package:agenda_pet/domain/usecases/get_pets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final AddPet addPet;
  final GetPets getPets;

  PetBloc({required this.addPet, required this.getPets}) : super(PetInitial());

  Stream<PetState> mapEventToState(PetEvent event) async* {
    if (event is AddPetEvent) {
      yield PetLoading();
      await addPet(event.pet);
      yield PetAdded();
      final pets = await getPets();
      yield PetsLoaded(pets: pets);
    } else if (event is GetPetsEvent) {
      yield PetLoading();
      final pets = await getPets();
      yield PetsLoaded(pets: pets);
    }
  }
}

abstract class PetEvent {}

class AddPetEvent extends PetEvent {
  final Pet pet;

  AddPetEvent(this.pet);
}

class GetPetsEvent extends PetEvent {}

abstract class PetState {}

class PetInitial extends PetState {}

class PetLoading extends PetState {}

class PetAdded extends PetState {}

class PetsLoaded extends PetState {
  final List<Pet> pets;

  PetsLoaded({required this.pets});
}
