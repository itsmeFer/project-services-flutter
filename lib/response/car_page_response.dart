import '../models/car_page_model.dart';

class CarPageResponse {
  final List<CarPageModel> listCarPage = [];

  CarPageResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      CarPageModel carPageModel = CarPageModel.fromJson(json[i]);
      listCarPage.add(carPageModel);
    }
  }
}
