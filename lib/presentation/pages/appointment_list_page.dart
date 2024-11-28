import 'package:agenda_pet/presentation/blocs/appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentListPage extends StatelessWidget {
  const AppointmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Agendamentos')),
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AppointmentsLoaded) {
            final appointments = state.appointments;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return ListTile(
                  title: Text(appointment.service),
                  subtitle: Text(
                    'Data: ${appointment.date}, Pet ID: ${appointment.petId}',
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum agendamento encontrado.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-appointment');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
