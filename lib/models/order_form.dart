class OrderForm {
  OrderForm({
    required this.pointToPickup,
    required this.destination,
    required this.selectedService,
    required this.typeMerchandise,
    required this.unitMerchandise,
    required this.length,
    required this.width,
    required this.height,
    required this.weight,
    required this.receiveCod,
  });

  String pointToPickup;
  String destination;
  int selectedService;
  String typeMerchandise;
  String unitMerchandise;
  int length;
  int width;
  int height;
  int weight;
  int receiveCod;

  set currentLocation(String address) {
    pointToPickup = address;
  }

  factory OrderForm.fromJson(Map<String, dynamic> json) => OrderForm(
        pointToPickup: json["pointToPickup"],
        destination: json["destination"],
        selectedService: json["selectedService"],
        typeMerchandise: json["typeMerchandise"],
        unitMerchandise: json["unitMerchandise"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        weight: json["weight"],
        receiveCod: json["receiveCod"],
      );

  Map<String, dynamic> toJson() => {
        "pointToPickup": pointToPickup,
        "destination": destination,
        "selectedService": selectedService,
        "typeMerchandise": typeMerchandise,
        "unitMerchandise": unitMerchandise,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "receiveCod": receiveCod,
      };
}