import 'package:agenda_pet/domain/entities/appointment.dart';
import 'package:agenda_pet/presentation/blocs/appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointmentPage extends StatelessWidget {
  final TextEditingController petIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();

  AddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Agendamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: petIdController,
              decoration: InputDecoration(labelText: 'ID do Pet'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Data (YYYY-MM-DD)'),
            ),
            TextField(
              controller: serviceController,
              decoration: InputDecoration(labelText: 'Serviço'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final appointment = Appointment(
                  id: 0,
                  petId: int.parse(petIdController.text),
                  date: DateTime.parse(dateController.text),
                  service: serviceController.text,
                );
                BlocProvider.of<AppointmentBloc>(
                  context,
                ).add(AddAppointmentEvent(appointment));
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
