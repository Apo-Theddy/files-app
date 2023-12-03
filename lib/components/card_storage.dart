import 'package:files_app/blocs/index/index_bloc.dart';
import 'package:files_app/blocs/index/index_states.dart';
import 'package:files_app/models/index_model.dart';
import 'package:files_app/models/storage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pie_chart/pie_chart.dart';

class Storage {
  Storage(this.nameStorage, this.storage);
  String nameStorage;
  double storage;
}

class CardStorage extends HookWidget {
  const CardStorage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataMap = useState<Map<String, double>>({});
    final totalSpace = useState<int>(0);
    final useSpace = useState<int>(0);

    useEffect(() {
      getStorage(context, dataMap, totalSpace, useSpace);
      return;
    }, []);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Storage"),
          Container(
              child: PieChart(
            dataMap: dataMap.value,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 5,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 15,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              showLegends: true,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${useSpace.value}% usage"),
              Text("${useSpace.value}GB/${totalSpace.value}GB")
            ],
          )
        ],
      ),
    );
  }

  void getStorage(
      BuildContext context,
      ValueNotifier<Map<String, double>> dataMap,
      ValueNotifier<int> totalSpace,
      ValueNotifier<int> useSpace) {
    final bloc = BlocProvider.of<IndexBloc>(context);
    if (bloc.state is IndexLoadedState) {
      // StorageModel storage = (bloc.state.props.first as IndexModel).storage;
      // totalSpace.value = storage.totalSpace.floor();
      // useSpace.value = ((storage.useSpace / totalSpace.value) * 100).floor();

      dataMap.value = {
        "Espacio Libre": 5,
        "Espacio en uso": 10,
      };
    }
  }
}
