// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/jobs.dart';
import '../bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return const HomeView(listJobs: []);
              } else if (state is HomeLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: Colors.black, strokeWidth: 6));
              } else if (state is HomeLoadedJobs) {
                return HomeView(
                  listJobs: state.listJobs,
                );
              } else {
                return const SizedBox();
              }
            },
          )),
        ));

    // Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: ,
    //     ),
    //   ),
    // );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.listJobs});
  final List<Jobs> listJobs;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(InitialEventHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          shrinkWrap: true,
          itemCount: widget.listJobs.length,
          itemBuilder: (context, index) => Row(children: [
                Container(child: Text(widget.listJobs[index].company)),
                Container(child: Text(widget.listJobs[index].description)),
                Container(child: Text(widget.listJobs[index].jobtype)),
                Container(child: Text(widget.listJobs[index].position)),
                Container(child: Text("\$ ${widget.listJobs[index].salary}"))
              ])),
      ElevatedButton(
          onPressed: () {
            homeBloc.add(GetListJobs());
          },
          child: const Text("Search jobs"))
    ]);
  }
}
