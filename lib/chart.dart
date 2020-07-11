import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyPieChart extends StatefulWidget {
  int active;
  int deaths;
  int recovered;
  MyPieChart(this.active, this.deaths, this.recovered);
  @override
  State<StatefulWidget> createState() {
    var datas = [this.active, this.deaths, this.recovered];
    return _MyPieChartState(datas);
  }

}

class _MyPieChartState extends State<MyPieChart> {
  Map <String, double> data = new Map();
  var datas;
  _MyPieChartState(this.datas);
  @override
  void initState() {
    double a = this.datas[0].toDouble();
    double b = this.datas[1].toDouble();
    double c = this.datas[2].toDouble();
    data.addAll(
      {
        'Active Cases': a,
        'Deaths': b,
        'Recovered': c,
      }
    );

    super.initState();
  }
  List<Color> _colors = [
    Colors.redAccent,
    Colors.amberAccent,
    Colors.greenAccent
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChart(
        dataMap: data,
        colorList: _colors,
        animationDuration: Duration(milliseconds: 2500),
        chartLegendSpacing: 30.0,
        chartRadius: 140.0,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        chartValueBackgroundColor: Colors.white,
        showLegends: true,
        legendPosition: LegendPosition.right,
        decimalPlaces: 1,
        showChartValueLabel: true,
        initialAngle: 0,
        chartValueStyle: defaultChartValueStyle.copyWith(
          color: Colors.blueGrey,
        ),
        chartType: ChartType.ring,
      ),
    );
  }

}