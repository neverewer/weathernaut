import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/condition_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/custom_divider.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/daily_forecast_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/date_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/hourly_forecast_label.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/hourly_forecast_item_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/list_separator.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/location_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_image_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_stat_widget.dart';

class HomeDataWidget extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherForecast;
  final List<DayEntity> dailyWeatherForecast;

  const HomeDataWidget({
    super.key,
    required this.currentWeatherForecast,
    required this.dailyWeatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.orange,
          onRefresh: () async => context.read<HomeBLoC>().add(const HomeEvent.fetch()),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
                  child: Column(
                    children: [
                      LocationWidget(text: currentWeatherForecast.location),
                      const SizedBox(height: 15),
                      DateWidget(text: currentWeatherForecast.formattedDate),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child: WeatherImageWidget(imagePath: currentWeatherForecast.conditionImagePath)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TempWidget(temp: currentWeatherForecast.temp.toString()),
                                ConditionWidget(condition: currentWeatherForecast.conditionText),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 35),
                      WeatherStatWidget(
                        leadingImagePath: 'assets/images/stats/rainfall.png',
                        label: context.localization.rainfall,
                        value: '${currentWeatherForecast.rainfall}${context.localization.rainfallUnitOfMeasurement}',
                      ),
                      const SizedBox(height: 15),
                      WeatherStatWidget(
                        leadingImagePath: 'assets/images/stats/wind.png',
                        label: context.localization.wind,
                        value: '${currentWeatherForecast.windSpeed}${context.localization.windUnitOfMeasurement}',
                      ),
                      const SizedBox(height: 15),
                      WeatherStatWidget(
                          leadingImagePath: 'assets/images/stats/humidity.png',
                          label: context.localization.humidity,
                          value: '${currentWeatherForecast.humidity}%'),
                      const SizedBox(height: 25),
                      DailyForecastWidget(dailyWeatherForecast: dailyWeatherForecast),
                      const SizedBox(height: 20),
                      const HourlyForecastLabel(),
                      const SizedBox(height: 12),
                      const CustomDivider()
                    ],
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: currentWeatherForecast.hourForecast.length,
                      itemBuilder: (_, index) {
                        return HourlyForecastItemWidget(
                          isNow: currentWeatherForecast.hourForecast[index].isNow,
                          time: currentWeatherForecast.hourForecast[index].time,
                          imagePath: currentWeatherForecast.hourForecast[index].conditionImageUrl,
                          temp: currentWeatherForecast.hourForecast[index].temp.toString(),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const ListSeparator();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
