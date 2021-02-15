import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/data/models/weather.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 0),
        height: mediaHeight * 0.14,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeather.length,
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Container(
                    color: i == 0 ? Colors.blue : Colors.white,
                    width: mediaWidth * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
                          style: TextStyle(color: Color(0xFF70D1F7)),
                        ),
                        Image.network(
                          "http://openweathermap.org/img/wn/${hourlyWeather[i].iconCode}@2x.png",
                          scale: 1.5,
                        ),
                        Text(
                          '${hourlyWeather[i].temperature.toInt()}°',
                          style: TextStyle(color: Color(0xFF70D1F7)),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Color(0xFF70D1F7).withOpacity(0.8),
                    indent: 25,
                    endIndent: 25,
                    width: 0.4,
                  )
                ],
              );
            }));
  }
}

//WeatherCard(
//               title:
//                   '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
//              temperature: hourlyWeather[i].temperature.toInt(),
//              iconCode: hourlyWeather[i].iconCode,
//             temperatureFontSize: 20,
//          )
