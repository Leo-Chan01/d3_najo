class CarListData {
  String? carName;
  double? price;
  String? imageUrl;
  String? location;
  double? rating;
  int? topSpeed;
  int? power;
  double? acceleration;

  CarListData(this.carName,
      {this.price = 0.0,
      this.imageUrl = '',
      this.location = '',
      this.rating = 0.0,
      this.topSpeed = 0,
      this.power = 0,
      this.acceleration = 0.0});

  static List<CarListData> carList = <CarListData>[
    CarListData("Audi RS 6 Avant",
        price: 57400.0,
        imageUrl: "assets/images/car_1.png",
        location: "Las Vegas",
        rating: 4.5,
        topSpeed: 190,
        power: 6500,
        acceleration: 4.4),
    CarListData("2022 Lambourghini Aventador",
        price: 501953.0,
        imageUrl: "assets/images/car_2.png",
        location: "Mexico",
        rating: 5.0,
        topSpeed: 217,
        power: 8500,
        acceleration: 2.8),
    CarListData("2015 Mercedes-Benz GLK 350",
        price: 40325.0,
        imageUrl: 'assets/images/car 3.png',
        location: "Germany",
        rating: 4.7,
        topSpeed: 145,
        power: 6500,
        acceleration: 6.8),
    CarListData("2022 Ferrari SF90 Stradale",
        price: 507000.0,
        imageUrl: "assets/images/car 4.png",
        location: "Germany",
        rating: 4.9,
        topSpeed: 148,
        power: 8500,
        acceleration: 2.0),
    CarListData("Bentley Continental GT",
        price: 210000.0,
        imageUrl: "assets/images/car 5.png",
        location: "Italy",
        rating: 5.0,
        topSpeed: 208,
        power: 5000,
        acceleration: 3.5),
    CarListData("2022 Ferrari SF90 Stradale",
        price: 40325.0,
        imageUrl: "assets/images/car 6.png",
        location: "Dublin",
        rating: 4.9,
        topSpeed: 148,
        power: 8500,
        acceleration: 2.0),
  ];
}
