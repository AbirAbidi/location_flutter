class EndHouse {
  EndHouse(
      {
      required this.details,
      required this.uid,
      required this.phone ,
      required this.location,
      required this.gouvernate,
      required this.price ,
      required this.image
});
  String details;
  String uid;
  String phone;
  String location;
  String gouvernate;
  String price;
  String image ;

  factory EndHouse.fromJson(Map<String, dynamic> json) => EndHouse(
        details: json["details"],
        uid: json["UID"],
        location: json["location"],
        gouvernate: json["gouvernate"],
        phone: json["phone"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "UID": uid,
        "location": location,
        "gouvernate": gouvernate,
        "phone":phone,
        "price":price,
        "image":image,
        "details":details
      };
}