import 'package:google_maps_flutter/google_maps_flutter.dart';

class DailyMapModel {
  List<LatLng> angryLatLng = [];
  List<LatLng> happyLatLng = [];
  List<LatLng> surprisedLatLng = [];
  DailyMapModel.fromJson(Map<String, dynamic> json) {
    json['daily']['angry'].forEach((e) {
      angryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['daily']['happy'].forEach((e) {
      happyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['daily']['surprised'].forEach((e) {
      surprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });
  }
}

class WeeklyMapModel {
  List<LatLng> firstAngryLatLng = [];
  List<LatLng> firstHappyLatLng = [];
  List<LatLng> firstSurprisedLatLng = [];
  List<LatLng> secondAngryLatLng = [];
  List<LatLng> secondHappyLatLng = [];
  List<LatLng> secondSurprisedLatLng = [];
  List<LatLng> thirdAngryLatLng = [];
  List<LatLng> thirdHappyLatLng = [];
  List<LatLng> thirdSurprisedLatLng = [];
  List<LatLng> fourthAngryLatLng = [];
  List<LatLng> fourthHappyLatLng = [];
  List<LatLng> fourthSurprisedLatLng = [];

  WeeklyMapModel.fromJson(Map<String, dynamic> json) {
    json['weekly']['first']['angry'].forEach((e) {
      firstAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['first']['happy'].forEach((e) {
      firstHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['first']['surprised'].forEach((e) {
      firstSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });

    json['weekly']['second']['angry'].forEach((e) {
      secondAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['second']['happy'].forEach((e) {
      secondHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['second']['surprised'].forEach((e) {
      secondSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });

    json['weekly']['third']['angry'].forEach((e) {
      thirdAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['third']['happy'].forEach((e) {
      thirdHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['third']['surprised'].forEach((e) {
      thirdSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });

    json['weekly']['fourth']['angry'].forEach((e) {
      fourthAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['fourth']['happy'].forEach((e) {
      fourthHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['weekly']['fourth']['surprised'].forEach((e) {
      fourthSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });
  }
}

class MonthlyMapModel {
  List<LatLng> firstAngryLatLng = [];
  List<LatLng> firstHappyLatLng = [];
  List<LatLng> firstSurprisedLatLng = [];
  List<LatLng> secondAngryLatLng = [];
  List<LatLng> secondHappyLatLng = [];
  List<LatLng> secondSurprisedLatLng = [];
  List<LatLng> thirdAngryLatLng = [];
  List<LatLng> thirdHappyLatLng = [];
  List<LatLng> thirdSurprisedLatLng = [];
  MonthlyMapModel.fromJson(Map<String, dynamic> json) {
    json['monthly']['first']['angry'].forEach((e) {
      firstAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['first']['happy'].forEach((e) {
      firstHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['first']['surprised'].forEach((e) {
      firstSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });

    json['monthly']['second']['angry'].forEach((e) {
      secondAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['second']['happy'].forEach((e) {
      secondHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['second']['surprised'].forEach((e) {
      secondSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });

    json['monthly']['third']['angry'].forEach((e) {
      thirdAngryLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['third']['happy'].forEach((e) {
      thirdHappyLatLng.add(LatLng(e['lat'], e['lng']));
    });
    json['monthly']['third']['surprised'].forEach((e) {
      thirdSurprisedLatLng.add(LatLng(e['lat'], e['lng']));
    });
  }
}
