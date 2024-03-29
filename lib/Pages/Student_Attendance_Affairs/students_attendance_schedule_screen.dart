import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_colors.dart';
import 'package:graduation_project/Pages/Student_Attendance_Affairs/subject_attendance_model.dart';
import 'package:graduation_project/provider/students_attendance_schedule_provider.dart';
import 'package:graduation_project/presentation/widgets/widgets/default_drop_down_button.dart';

import 'package:provider/provider.dart';

class StudentsAttendanceScheduleScreen extends StatelessWidget {
  const StudentsAttendanceScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? level = StudentsAttendanceScheduleProvider().level;
    List<String> levels = StudentsAttendanceScheduleProvider().levels;
    String? department = StudentsAttendanceScheduleProvider().department;
    List<String> departments = StudentsAttendanceScheduleProvider().departments;
    String? division = StudentsAttendanceScheduleProvider().division;
    List<String> divisions = StudentsAttendanceScheduleProvider().divisions;
    List<SubjectAttendanceModel> subjectsAttendance =
        StudentsAttendanceScheduleProvider().subjectsAttendance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StudentsAttendanceScheduleProvider>(
          create: (_) => StudentsAttendanceScheduleProvider(),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
          child: Column(
            children: [
              Text(
                "جدول حضور الطلبة",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    "الفرقة",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DefaultDropDownButton(
                      list: levels,
                      value: level,
                      onChanged: (value) {
                        StudentsAttendanceScheduleProvider()
                            .changeLevel(selectedLevel: value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "القسم",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DefaultDropDownButton(
                      list: departments,
                      value: department,
                      onChanged: (value) {
                        StudentsAttendanceScheduleProvider()
                            .changeDepartment(selectedDepartment: value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "الشعبة",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DefaultDropDownButton(
                      list: divisions,
                      value: division,
                      onChanged: (value) {
                        StudentsAttendanceScheduleProvider()
                            .changeDivision(selectedDivision: value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                        width: 8.0,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Table(
                        textDirection: TextDirection.rtl,
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                            ),
                            children: [
                              const Text(
                                "الكود",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "الاسم",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              ...List.generate(
                                subjectsAttendance.length,
                                (index) => FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          subjectsAttendance[index].subjectName,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            StudentsAttendanceScheduleProvider()
                                                .subjectsAttendance[index]
                                                .subjectAttendance
                                                .length,
                                            (index) => Text(
                                              (++index).toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                "${StudentsAttendanceScheduleProvider().code}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(
                                    "${StudentsAttendanceScheduleProvider().name}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ...List.generate(
                                subjectsAttendance.length,
                                (firstIndex) => FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Row(
                                      children: List.generate(
                                        StudentsAttendanceScheduleProvider()
                                            .subjectsAttendance[firstIndex]
                                            .subjectAttendance
                                            .length,
                                        (index) =>
                                            StudentsAttendanceScheduleProvider()
                                                            .subjectsAttendance[
                                                                firstIndex]
                                                            .subjectAttendance[
                                                        index] ==
                                                    true
                                                ? InkWell(
                                                    onTap: () {
                                                      StudentsAttendanceScheduleProvider()
                                                          .changeSubjectAttendance(
                                                              subjectIndex:
                                                                  firstIndex,
                                                              attendanceIndex:
                                                                  index);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey)),
                                                      child: Icon(
                                                        Icons.check,
                                                        color: AppColors.grey,
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      StudentsAttendanceScheduleProvider()
                                                          .changeSubjectAttendance(
                                                              subjectIndex:
                                                                  firstIndex,
                                                              attendanceIndex:
                                                                  index);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey)),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: AppColors.grey,
                                                      ),
                                                    ),
                                                  ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
