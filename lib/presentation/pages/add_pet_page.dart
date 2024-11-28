import 'package:agenda_pet/domain/entities/pet.dart';
import 'package:agenda_pet/presentation/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPetPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();

  AddPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Pet'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: breedController,
              decoration: InputDecoration(labelText: 'Raça'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final pet = Pet(
                  id: 0,
                  name: nameController.text,
                  breed: breedController.text,
                );
                BlocProvider.of<PetBloc>(context).add(AddPetEvent(pet));
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
