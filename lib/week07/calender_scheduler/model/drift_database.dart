import 'package:myapp/week07/calender_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
  ],
)
class LocalDatabase extends _$LocalDatabase { 
  LocalDatabase() : super(_openConnection());

  Stream<List<Schedule>> watchSchedules(DateTime date) =>
    (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

    // watchSchedules() 함수 아래에 작성
  Future<int> createSchedule(SchedulesCompanion data) =>
    into(schedules).insert(data);

  // createSchedule() 함수 아래에 작성
  Future<int> removeSchedule(int id) =>
    (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  // removeSchedule() 함수 아래에 작성
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 데이터베이스 파일 저장할 폴더
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}