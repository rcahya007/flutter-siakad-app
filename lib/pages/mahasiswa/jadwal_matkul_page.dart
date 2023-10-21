import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rendy_siakad_app/bloc/schedule/schedules_bloc.dart';
import 'package:flutter_rendy_siakad_app/common/constants/images.dart';
import 'package:flutter_rendy_siakad_app/common/extensions/date_time_ext.dart';
import 'package:flutter_rendy_siakad_app/common/widgets/custom_scaffold.dart';
import 'package:flutter_rendy_siakad_app/pages/mahasiswa/models/course_schedule_model.dart';
import 'package:flutter_rendy_siakad_app/pages/mahasiswa/widgets/course_schedule_tile.dart';
import 'package:flutter_rendy_siakad_app/pages/mahasiswa/widgets/course_with_image.dart';

class JadwalMatkulPage extends StatefulWidget {
  const JadwalMatkulPage({super.key});

  @override
  State<JadwalMatkulPage> createState() => _JadwalMatkulPageState();
}

class _JadwalMatkulPageState extends State<JadwalMatkulPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SchedulesBloc>().add(const SchedulesEvent.getSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // padding: const EdgeInsets.all(24.0),
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            const Text(
              "Jadwal MK",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CourseWithImage(
                    name: 'Basis Data',
                    imagePath: Images.basisData,
                  ),
                  CourseWithImage(
                    name: 'Algoritma',
                    imagePath: Images.algoritma,
                  ),
                  CourseWithImage(
                    name: 'RPL',
                    imagePath: Images.rpl,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              DateTime.now().toFormattedDateWithDay(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 18.0),
            Expanded(
              child: BlocBuilder<SchedulesBloc, SchedulesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox();
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) => ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) => CourseScheduleTile(
                        data: CourseScheduleModel(
                          startTime: data[index].jamMulai,
                          endTime: data[index].jamSelesai,
                          dateStart: DateTime.now(),
                          longTimeTeaching: 90,
                          course: data[index].subject.title,
                          lecturer: data[index].subject.lecturer.name,
                          description: data[index].ruangan,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}