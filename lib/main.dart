import 'package:agenda_pet/presentation/blocs/bloc_providers.dart';
import 'package:agenda_pet/presentation/pages/add_pet_page.dart';
import 'package:agenda_pet/presentation/routes/app_routes.dart';
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
      providers: BlocProviders.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.getRoutes(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddPetPage(),
      ),
    );
  }
}
