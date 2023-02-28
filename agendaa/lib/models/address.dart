class Address {
  Address({
    required this.id,
    required this.address,
    required this.country,
    required this.client,
    required this.zipCode,
    required this.city,
  });

  int id;
  String address;
  String country;
  dynamic client;
  String zipCode;
  String city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        country: json["country"],
        client: json["client"],
        zipCode: json["zipCode"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "country": country,
        "client": client,
        "zipCode": zipCode,
        "city": city,
      };
}
