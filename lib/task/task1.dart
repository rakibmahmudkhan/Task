class Car {
  String brand;
  String model;
  int year;
  double milesDriven;

  static int numberOfCars = 0;

  Car(this.brand, this.model, this.year, this.milesDriven) {
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    DateTime now = DateTime.now();
    return now.year - year;
  }
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 2010, 50000);
  Car car2 = Car('Honda', 'Accord', 2015, 30000);
  Car car3 = Car('Ford', 'Mustang', 2018, 10000);

  car1.drive(150);
  car2.drive(200);
  car3.drive(50);

  print(
      'Car 1: ${car1.getBrand()} ${car1.getModel()} (${car1.getYear()}) - Miles driven: ${car1.getMilesDriven()} - Age: ${car1.getAge()} years');
  print(
      'Car 2: ${car2.getBrand()} ${car2.getModel()} (${car2.getYear()}) - Miles driven: ${car2.getMilesDriven()} - Age: ${car2.getAge()} years');
  print(
      'Car 3: ${car3.getBrand()} ${car3.getModel()} (${car3.getYear()}) - Miles driven: ${car3.getMilesDriven()} - Age: ${car3.getAge()} years');

  print('Total number of cars created: ${Car.numberOfCars}');
}
