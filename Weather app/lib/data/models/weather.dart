class Weather {
  final String cityName;
  final int temperature;
  final int feelsLike;
  final String iconCode;
  final String description;
  final DateTime time;
  final int humidity;
  final int pressure;
  final double weatherSpeed;

  Weather({
    this.weatherSpeed,
    this.pressure,
    this.humidity,
    this.feelsLike,
    this.cityName,
    this.temperature,
    this.iconCode,
    this.description,
    this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        feelsLike: double.parse(json['main']['feels_like'].toString()).toInt(),
        humidity: int.parse(json['main']['humidity'].toString()),
        pressure: int.parse(json['main']['pressure'].toString()),
        iconCode: json['weather'][0]['icon'],
        description: json['weather'][0]['main'],
        weatherSpeed: double.parse(json['wind']['speed'].toString()),
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
  }
}
