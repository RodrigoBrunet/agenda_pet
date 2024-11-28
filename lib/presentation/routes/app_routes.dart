import 'package:agenda_pet/presentation/pages/add_appointment_page.dart';
import 'package:agenda_pet/presentation/pages/add_pet_page.dart';
import 'package:agenda_pet/presentation/pages/appointment_list_page.dart';
import 'package:agenda_pet/presentation/pages/pet_list_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => PetListPage(),
      '/add-pet': (context) => AddPetPage(),
      '/appointments': (context) => AppointmentListPage(),
      '/add-appointment': (context) => AddAppointmentPage(),
    };
  }
}
