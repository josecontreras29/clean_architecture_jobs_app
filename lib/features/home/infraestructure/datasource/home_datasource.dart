import 'package:shared_preferences/shared_preferences.dart';

import '../../../../-core/datasources/http.dart';
import '../models/get_jobs_model.dart';

abstract class HomeDataSource {
  Future<List<GetJobsModel>> getJobs();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ClientHttp client;
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.client, required this.sharedPreferences});
  @override
  Future<List<GetJobsModel>> getJobs() async {
    // final response = await client.get(
    //     url: "https://127.0.0.1:3000/api/v1/auth/getJobs",
    //     headers: {'Authorization': tokenAuth});
    final response = [
      {
        "position": "Sr Flutter Developer",
        "company": "Company1",
        "jobtype": "Remote",
        "salary": "1000",
        "description": "Senior flutter dev"
      },
      {
        "position": "Sr React Developer",
        "company": "Company2",
        "jobtype": "Remote",
        "salary": "2000",
        "description": "Senior react dev"
      },
      {
        "position": "Junior .NET Developer",
        "company": "Company2",
        "jobtype": "Hybrid",
        "salary": "3000",
        "description": "Senior .NET dev"
      }
    ];

    ///[response.code == 200]///
    if (true) {
      await Future.delayed(const Duration(seconds: 2));
      List<GetJobsModel> listJobs = [];
      for (var item in response) {
        GetJobsModel job = GetJobsModel.fromJson(item);
        listJobs.add(job);
      }
      return listJobs;
    } else {
      throw Exception("Error  ");
      // throw Exception("Error ${response.code}");
    }
  }
}
