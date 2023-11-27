import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/condition_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/custom_divider.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/date_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/list_item_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/list_separator.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/list_tab_bar.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/location_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_image_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_stat_widget.dart';

class HomeDataWidget extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherForecast;
  final List<DayEntity>? weaklyWeatherForecast;

  const HomeDataWidget({super.key, required this.currentWeatherForecast, required this.weaklyWeatherForecast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<HomeBLoC>().add(
                const HomeEvent.fetch(),
              ),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
                    child: Column(
                      children: [
                        LocationWidget(text: currentWeatherForecast.location),
                        const SizedBox(height: 15),
                        DateWidget(text: currentWeatherForecast.formattedDate),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherImageWidget(imagePath: currentWeatherForecast.conditionImagePath),
                              Column(
                                children: [
                                  TempWidget(temp: currentWeatherForecast.temp.toString()),
                                  ConditionWidget(condition: currentWeatherForecast.conditionText),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        WeatherStatWidget(
                          leadingImagePath: 'assets/images/stats/rainfall.png',
                          label: 'RainFall',
                          value: '${currentWeatherForecast.rainfall}cm',
                        ),
                        const SizedBox(height: 15),
                        WeatherStatWidget(
                          leadingImagePath: 'assets/images/stats/wind.png',
                          label: 'Wind',
                          value: '${currentWeatherForecast.windSpeed}km/h',
                        ),
                        const SizedBox(height: 15),
                        WeatherStatWidget(
                          leadingImagePath: 'assets/images/stats/humidity.png',
                          label: 'Humidity',
                          value: '${currentWeatherForecast.humidity}%',
                        ),
                        const Spacer(),
                        ListTabBar(weaklyWeatherForecast: weaklyWeatherForecast),
                        const SizedBox(height: 12),
                        const CustomDivider()
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: currentWeatherForecast.hourForecast.length,
                      itemBuilder: (_, index) {
                        return ListItemWidget(
                          isNow: currentWeatherForecast.hourForecast[index].isNow,
                          time: currentWeatherForecast.hourForecast[index].time,
                          imagePath: currentWeatherForecast.hourForecast[index].conditionImageUrl,
                          temp: currentWeatherForecast.hourForecast[index].temp.toString(),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const ListSeparator();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
