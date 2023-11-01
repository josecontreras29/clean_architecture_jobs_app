

import '../../../../-core/params/default_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/jobs.dart';
import '../repositories/home_repository.dart';

class GetJobs extends UseCase<List<Jobs>, NoParams> {
  final HomeRepository repository;
  GetJobs({required this.repository});
  @override
  Future<List<Jobs>> call(NoParams params) async {
    return await repository.getJobs();
  }
}
