
import 'package:get_it/get_it.dart';
import 'package:myapp/week07/calender_scheduler/model/drift_database.dart';

import 'package:myapp/week07/calender_scheduler/component/schedule_bottom_sheet.dart';
import 'package:myapp/week07/calender_scheduler/const/colors.dart';
import 'package:myapp/week07/calender_scheduler/component/today _banner.dart';
import 'package:myapp/week07/calender_scheduler/component/schedule_card.dart';
import 'package:myapp/week07/calender_scheduler/component/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

lass HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(  

      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate,
            ),
            isScrollControlled: true,
          );
       