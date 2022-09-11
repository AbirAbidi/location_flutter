import 'dart:convert';

Roommate RoommateFromJson(String str) => Roommate.fromJson(json.decode(str));

String RoommateToJson(Roommate data) => json.encode(data.toJson());

class Roommate {
    Roommate({
        required this.info,
        required this.uid
    });

    String info;

    String uid;

    factory Roommate.fromJson(Map<String, dynamic> json) => Roommate(
        info: json["info"],

        uid: json["uid"]
    );

    Map<String, dynamic> toJson() => {
        "info": info,
        'uid':uid
    };
}
