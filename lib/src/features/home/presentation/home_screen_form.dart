import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_widget.dart';
import 'package:weathernaut/src/core/presentation/widgets/loading_widget.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_state.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/home_data_widget.dart';

class HomeScreenForm extends StatelessWidget {
  const HomeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBLoC, HomeState>(
      builder: (context, state) => state.map(
        idle: (_) => const LoadingWidget(),
        processing: (_) => const LoadingWidget(),
        successful: (_) => state.hasCurrentWeatherForecast
            ? HomeDataWidget(
                currentWeatherForecast: state.currentWeatherForecast!,
                weaklyWeatherForecast: state.weaklyWeatherForecast,
              )
            : FailtureWidget(
                errorButtonCallback: () => context.read<HomeBLoC>().add(
                      const HomeEvent.fetch(),
                    ),
              ),
        error: (_) => FailtureWidget(
          errorMessage: state.message,
          errorButtonCallback: () => context.read<HomeBLoC>().add(
                const HomeEvent.fetch(),
              ),
        ),
      ),
    );
  }
}
