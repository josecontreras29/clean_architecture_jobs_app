import 'dart:async';
import 'dart:math';

import 'package:clean_architecture_jobs_app/-core/params/default_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_jobs_usecase.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetJobs getJobs})
      : _getJobs = getJobs,
        super(HomeInitial()) {
    on<InitialEventHome>(initialEventHome);
    on<GetListJobs>(getListJobs);
  }

  final GetJobs _getJobs;

  void initialEventHome(InitialEventHome event, Emitter<HomeState> emit) {}

  void getListJobs(event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final listJobs = await _getJobs.call(NoParams());
    for (var element in listJobs) {
      print([
        element.company,
        element.description,
        element.jobtype,
        element.position,
        element.salary
      ]);
    }
    emit(HomeLoadedJobs(listJobs: listJobs));
  }
}
