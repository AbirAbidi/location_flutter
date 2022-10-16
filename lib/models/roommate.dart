import 'dart:convert';

import 'package:location_flutter/pages/usercred.dart';

Roommate RoommateFromJson(String str) => Roommate.fromJson(json.decode(str));

String RoommateToJson(Roommate data) => json.encode(data.toJson());

class Roommate {
    Roommate({
        required this.info,
        required this.uid,
        required this.location   });

    String info;
    String location ;
    String uid;

    factory Roommate.fromJson(Map<String, dynamic> json) => Roommate(
        info: json["info"],
        location : json["location"],
        uid: json["uid"]
    );

    Map<String, dynamic> toJson() => {
        "info": info,
        'uid':uid,
        "location":location
    };
}
