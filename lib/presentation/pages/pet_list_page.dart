import 'package:agenda_pet/presentation/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetListPage extends StatelessWidget {
  const PetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Pets')),
      body: BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          if (state is PetLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PetsLoaded) {
            final pets = state.pets;
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return ListTile(
                  title: Text(pet.name),
                  subtitle: Text(pet.breed),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum pet encontrado.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-pet');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
