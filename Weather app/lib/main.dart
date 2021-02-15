import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/widgets/main_screen.dart';
import 'package:weather_app/presentation/widgets/SearchDelegate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'logic/bloc/weather_bloc.dart';
import 'logic/bloc/weather_event.dart';
import 'logic/bloc/weather_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              backgroundColor: Color(0xFFF5F5F5),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                leading: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: MySearchDelegate((query) {
                          BlocProvider.of<WeatherBloc>(context)
                              .add(WeatherRequested(city: query));
                        }));
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(WeatherCurrentPositionRequested());
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 10),
                child: MainScreen(
                    weather: state.weather, hourlyWeather: state.hourlyWeather),
              ),
            );
          }
          return Scaffold(
              backgroundColor: Color(0xFFCECECE),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: MySearchDelegate((query) {
                          BlocProvider.of<WeatherBloc>(context)
                              .add(WeatherRequested(city: query));
                        }));
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(WeatherCurrentPositionRequested());
                    },
                  ),
                ],
              ),
              body: Center(
                child: SpinKitWave(
                  size: MediaQuery.of(context).size.height / 8,
                  color: Colors.black,
                ),
              ));
        },
      ),
    );
  }
}
