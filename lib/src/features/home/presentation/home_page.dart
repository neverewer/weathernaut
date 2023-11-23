import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/features/dependencies/widgets/dependencies_scope.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/home_page_form.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeBLoC(
              weatherRepository: DependenciesScope.of(context).weatherRepository,
              positionRepository: DependenciesScope.of(context).positionRepository,
            )..add(const HomeEvent.fetch()),
        child: const HomePageForm());
  }
}
