import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  // Network에서와는 달리 named argument를 통해서 입력받기를 원하는 데이터를
  // 전달해야한다는 것임. 생성자의 {}를 주의해야 함.
  WeatherScreen({this.parseWeatherData});

  // 다양한 타입의 날씨 관련 데이터를 전달받을 것이기 때문에 타입을 따로 지정해주지 않음
  // dynamic 타입이라고 해줘도 됨
  final parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int temp;
  String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {

    double temp2 = weatherData['main']['temp'];
    print(temp2);

    temp = temp2.round(); // 반올림
    // temp = temp2.toInt(); // 이것도 가능 (버림)
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '$temp',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
