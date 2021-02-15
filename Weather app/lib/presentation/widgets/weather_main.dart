import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int pressure;
  final String iconCode;
  final double temperatureFontSize;
  final double fontSize;
  final double iconScale;
  final double weatherSpeed;
  final String description;

  const WeatherCard(
      {Key key,
      this.feelsLike,
      this.description,
      this.title,
      this.pressure,
      this.temperature,
      this.iconCode,
      this.humidity,
      this.weatherSpeed,
      this.temperatureFontSize = 32,
      this.fontSize = 22,
      this.iconScale = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        GoogleFonts.poppins(fontSize: this.fontSize, color: Colors.black87);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF70D1F7)),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Feels like: ${this.feelsLike}°', style: textStyle),
                    Text('Humidity: ${this.humidity}%', style: textStyle),
                    Text('Pressure: ${this.pressure} mBar', style: textStyle),
                    Text('Wind speed: ${this.weatherSpeed}km/h',
                        style: textStyle),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(this.title, style: textStyle),
                    Text(
                      '${this.temperature}°',
                      style: TextStyle(
                          fontSize: this.temperatureFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('${this.description}', style: textStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
