import 'package:myapp/week07/calender_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myapp/week07/calender_scheduler/model/drift_database.dart';
import 'package:get_it/get_it.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

}
