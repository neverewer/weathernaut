import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/presentation/widgets/base_data_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/condition_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/date_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/location_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_image_widget.dart';

class HomeDataWidget extends BaseDataWidget {
  final CurrentWeatherEntity data;
  const HomeDataWidget({
    super.key,
    required this.data,
  });

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 15),
                    child: Column(
                      children: [
                        LocationWidget(
                          text: data.location,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DateWidget(text: data.formattedDate),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherImageWidget(imagePath: data.conditionImagePath),
                              Column(
                                children: [
                                  TempWidget(temp: data.temp.toString()),
                                  ConditionWidget(condition: data.conditionText),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
