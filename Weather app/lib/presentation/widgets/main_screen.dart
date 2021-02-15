import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/weather_Animation.dart';

import 'weather_main.dart';
import 'weather_hours.dart';

class MainScreen extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const MainScreen({Key key, this.weather, this.hourlyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaText = MediaQuery.of(context).textScaleFactor;
    var mediaHieght = MediaQuery.of(context).size.height;
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Text(
            weather.cityName,
            style: GoogleFonts.poppins(
                fontSize: mediaText * 23, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: mediaHieght * 0.05,
        ),
        SnowAnimation(
          weather.description,
        ),
        Spacer(),
        WeatherCard(
          title: "Now",
          description: weather.description,
          temperature: weather.temperature,
          feelsLike: weather.feelsLike,
          iconCode: weather.iconCode,
          temperatureFontSize: mediaText * 38,
          fontSize: mediaText * 17,
          iconScale: 1,
          weatherSpeed: weather.weatherSpeed,
          humidity: weather.humidity,
          pressure: weather.pressure,
        ),
        Spacer(),
        Text(
          '3 Hours Forecast',
          style: GoogleFonts.poppins(fontSize: 22),
        ),
        HourlyWeather(hourlyWeather: this.hourlyWeather)
      ]),
    );
  }
}
