import 'package:agenda_pet/domain/entities/pet.dart';

class PetModel extends Pet {
  PetModel({required super.id, required super.name, required super.breed});

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(id: map['id'], name: map['name'], breed: map['breed']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'breed': breed};
  }
}
