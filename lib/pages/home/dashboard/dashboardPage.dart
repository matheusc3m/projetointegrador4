import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/dashboard/dashboardController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController controller = DashboardController();
  @override
  Widget build(BuildContext context) {
    var lista = ["joao"];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          )
        ],
        title: const Text('Dashboard'),
      ),
      body: FutureBuilder(
          future: controller.getAlcool(),
          initialData: controller.getAlcool(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    strokeWidth: 5.0,
                  ),
                );
              default:
                if (snapshot.hasError)
                  return Container(
                    color: Colors.red,
                  );
                else

                  // return _createStar(context, snapshot);

                  return snapshot.data["busca"].length > 0
                      ? SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          title: ChartTitle(
                              text: 'Perda de Álcool ao longo do ano em %'),
                          // Enable legend
                          legend: Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<_SalesData, String>>[
                              LineSeries<_SalesData, String>(
                                  dataSource: <_SalesData>[
                                    _SalesData(
                                        snapshot.data["busca"][5]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][5]
                                                ["average"]
                                            .toString())),
                                    _SalesData(
                                        snapshot.data["busca"][4]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][4]
                                                ["average"]
                                            .toString())),
                                    _SalesData(
                                        snapshot.data["busca"][3]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][3]
                                                ["average"]
                                            .toString())),
                                    _SalesData(
                                        snapshot.data["busca"][2]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][2]
                                                ["average"]
                                            .toString())),
                                    _SalesData(
                                        snapshot.data["busca"][1]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][1]
                                                ["average"]
                                            .toString())),
                                    _SalesData(
                                        snapshot.data["busca"][0]["month"]
                                            .toString(),
                                        double.parse(snapshot.data["busca"][0]
                                                ["average"]
                                            .toString())),
                                  ],
                                  xValueMapper: (_SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (_SalesData sales, _) =>
                                      sales.sales,
                                  // Enable data label
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true))
                            ])
                      : Center(
                          child: Text(
                            "A Lista está vazia!!!",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "FredokaOne",
                                fontSize: 30),
                          ),
                        );
            }
          }),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
