import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var lista = ["joao"];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Perda de Álcool ao longo do ano em %'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                  dataSource: <_SalesData>[
                    _SalesData('Jan', 23),
                    _SalesData('Fev', 28),
                    _SalesData('Mar', 34),
                    _SalesData('Abr', 32),
                    _SalesData('Mai', 22),
                    _SalesData('Jun', 17),
                    _SalesData('Jul', 30),
                  ],
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
