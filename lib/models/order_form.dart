class OrderForm {

  OrderForm({
    required this.pointToPickup,
    this.destination
  });

  String pointToPickup;
  String? destination;


  set currentLocation(String address) {
    pointToPickup = address;
  }

  factory OrderForm.fromJson(Map<String, dynamic> json) =>
      OrderForm(
        pointToPickup: json["pointToPickup"],
        destination: json["destination"],
      );


  Map<String, dynamic> toJson() => {
    "pointToPickup": pointToPickup,
    "destination": destination,
  };

}