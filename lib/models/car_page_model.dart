class CarPageModel {
  int? id;
  int? category;
  String? name;
  int? price;
  String? fuelType;
  int? baggageCapacity;
  int? seats;
  String? plateNumber;
  int? year;
  String? locationCar;
  int? rating;
  String? statusCar;

  CarPageModel(
      {this.id,
      this.category,
      this.name,
      this.price,
      this.fuelType,
      this.baggageCapacity,
      this.seats,
      this.plateNumber,
      this.year,
      this.locationCar,
      this.rating,
      this.statusCar});

  CarPageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name_car'];
    price = json['price'];
    fuelType = json['fuel_type'];
    baggageCapacity = json['baggage_capacity'];
    seats = json['seats'];
    plateNumber = json['plate_number'];
    year = json['year'];
    locationCar = json['location_car'];
    rating = json['rating'];
    statusCar = json['status_car'];
  }
}
