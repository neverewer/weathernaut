import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/core/presentation/widgets/base_screen.dart';
import 'package:weathernaut/src/features/dependencies/widgets/dependencies_scope.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/home_screen_form.dart';

@RoutePage()
class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  Widget buildChild(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeBLoC(
              weatherRepository: DependenciesScope.of(context).weatherRepository,
              positionRepository: DependenciesScope.of(context).positionRepository,
            )..add(const HomeEvent.fetch()),
        child: const HomeScreenForm());
  }
}
