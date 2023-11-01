import '../../domain/entities/jobs.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/home_datasource.dart';

class HomeImpl implements HomeRepository {
  final HomeDataSource remoteDataSource;

  HomeImpl({required this.remoteDataSource});

  @override
  Future<List<Jobs>> getJobs() async {
    try {
      return await remoteDataSource.getJobs();
    } catch (error) {
      throw error.toString();
    }
  }
}
