import '../../domain/entities/jobs.dart';

class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadedJobs extends HomeState {
  final List<Jobs> listJobs;
  HomeLoadedJobs({required this.listJobs});
}
