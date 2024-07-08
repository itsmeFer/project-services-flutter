import 'package:app_car/models/car_page_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../bottom_nav_bar.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  Future<List<CarPageModel>> getCarPages() async {
    try {
      var response = await Dio().get("http://10.0.2.2:8000/api/car");
      debugPrint('Response car page : ${response.data}');

      if (response.statusCode != 200) throw Exception('Failed to fecth data');

      List list = response.data;
      List<CarPageModel> listCarPage =
          list.map((element) => CarPageModel.fromJson(element)).toList();

      return listCarPage;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getCarPages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Car Halaman'),
      ),
      body: FutureBuilder(
        future: getCarPages(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            List<CarPageModel> list = snapshot.data;
            debugPrint(list.toString());
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index].name.toString()),
                  subtitle: Text(list[index].category.toString()),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
              itemCount: list.length,
            );
          } else {
            return const Center(
              child: Text('Does not data'),
            );
          }
        },
      ),
    );
  }
}
