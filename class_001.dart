class Mobile {
  String? name;
  int? price;
  int? ram;
  int? battery;
  String? dimensions;

  //using required order of passing arguments to a parameterized constructor is independent
  Mobile({
    required this.name,
    required this.price,
    required this.ram,
    required this.battery,
    required this.dimensions,
  });

  void showdata() {
    print("Name is $name");
    print("Price is $price");
    print("Ram capacity $ram GB");
    print("Battery life $battery mAH");
    print("Dimensions are $dimensions");
  }
}

void main() {
  Mobile m1 = Mobile(
    name: "Samsung",
    price: 76000,
    ram: 8,
    battery: 5000,
    dimensions: "480x720",
  );
  m1.showdata();
}
