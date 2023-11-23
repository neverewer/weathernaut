import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_state.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/home_data_widget.dart';

class HomePageForm extends StatelessWidget {
  const HomePageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBLoC, HomeState>(
      builder: (context, state) => state.map(
        idle: (_) => Container(color: Colors.white),
        processing: (_) => Container(color: Colors.green),
        successful: (_) => state.hasData ? HomeDataWidget(data: state.data!) : Container(color: Colors.black),
        error: (_) => Container(color: Colors.red),
      ),
    );
  }
}
