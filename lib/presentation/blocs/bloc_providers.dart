import 'package:agenda_pet/injection_container.dart' as di;
import 'package:agenda_pet/presentation/blocs/appointment_bloc.dart';
import 'package:agenda_pet/presentation/blocs/pet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => di.it<PetBloc>()),
    BlocProvider(create: (_) => di.it<AppointmentBloc>()),
  ];
}
