import 'package:dartz/dartz.dart';
import 'package:flutter_rendy_siakad_app/common/constants/variables.dart';
import 'package:flutter_rendy_siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_rendy_siakad_app/data/models/response/schedule_response_model.dart';
import 'package:http/http.dart' as http;

class ScheduleRemoteDatasource {
  Future<Either<String, ScheduleResponseModel>> getSchedules() async {
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': "Bearer ${await AuthLocalDatasource().getToken()}"
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/schedules'),
      headers: header,
    );

    if (response.statusCode == 200) {
      return Right(ScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}
