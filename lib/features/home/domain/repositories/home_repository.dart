import '../entities/jobs.dart';

abstract class HomeRepository {
  Future<List<Jobs>> getJobs();
}
