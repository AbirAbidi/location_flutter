class EndUser {
  EndUser(
      {required this.uid,
     required this.email,
    required  this.urlAvatar,
      required this.phone ,
       required this.location,
     required  this.username
});

  String uid;
  String email;
  String urlAvatar;
  String phone;
  String location;
  String username ;

  factory EndUser.fromJson(Map<String, dynamic> json) => EndUser(
        uid: json["UID"],
        email: json["email"],
        urlAvatar: json["urlAvatar"],
        phone: json["phone"],
        location: json["location"],
        username: json["username"]
      );

  Map<String, dynamic> toJson() => {
        "UID": uid,
        "email": email,
        "urlAvatar": urlAvatar,
        "phone":phone,
        "location":location,
        "username":username
      };
}