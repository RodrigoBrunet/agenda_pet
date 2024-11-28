import 'package:agenda_pet/presentation/blocs/appointment_bloc.dart';
import 'package:agenda_pet/presentation/blocs/pet_bloc.dart';
import 'package:agenda_pet/presentation/pages/add_appointment_page.dart';
import 'package:agenda_pet/presentation/pages/add_pet_page.dart';
import 'package:agenda_pet/presentation/pages/appointment_list_page.dart';
import 'package:agenda_pet/presentation/pages/pet_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.it<PetBloc>()),
        BlocProvider(create: (_) => di.it<AppointmentBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/': (context) => PetListPage(),
          '/add-pet': (context) => AddPetPage(),
          '/appointments': (context) => AppointmentListPage(),
          '/add-appointment': (context) => AddAppointmentPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddPetPage(),
      ),
    );
  }
}
