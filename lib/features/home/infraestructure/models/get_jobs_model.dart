import '../../domain/entities/jobs.dart';

class GetJobsModel extends Jobs {
  GetJobsModel(
      {required super.position,
      required super.company,
      required super.jobtype,
      required super.salary,
      required super.description});

  factory GetJobsModel.fromJson(Map<String, dynamic> json) {
    return GetJobsModel(
        position: json["position"],
        company: json["company"],
        jobtype: json["jobtype"],
        salary: int.parse(json["salary"]),
        description: json["description"]);
  }
}
