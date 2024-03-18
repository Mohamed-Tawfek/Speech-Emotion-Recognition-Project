import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../models/emotions_map_model.dart';

part 'statistics_map_state.dart';

class StatisticsMapCubit extends Cubit<StatisticsMapState> {
  StatisticsMapCubit() : super(StatisticsMapInitial());
  static StatisticsMapCubit get(context) => BlocProvider.of(context);
  int statisticsIndex = 0;
  int weeklyIndex = 0;
  int monthlyIndex = 0;
  int emotionIndex = 0;

  List<String> statisticsList = ['Daily'.tr(), 'Weekly'.tr(), 'Monthly'.tr()];
  DailyMapModel? dailyMapModel;
  WeeklyMapModel? weeklyMapModel;
  MonthlyMapModel? monthlyMapModel;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  List<String> weeklyList = [
    '1',
    '2',
    '3',
    '4',
  ];
  List<String> monthlyList = ['1', '2', '3'];

  List<String> emotionList = ['Happy'.tr(), 'Angry'.tr(), 'Surprised'.tr()];

  bool weeklyIsSelected = false;
  bool monthlyIsSelected = false;
  bool dailyIsSelected = true;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(28.097746, 30.755358),
    zoom: 18,
  );
  double markerColor = BitmapDescriptor.hueRed;

  setMapController({required GoogleMapController  mapController }){

    this.mapController=mapController;
    emit(SetMapControllerState());
  }


  getData() {
    dailyMapModel = DailyMapModel.fromJson(testMap);
    weeklyMapModel = WeeklyMapModel.fromJson(testMap);
    monthlyMapModel = MonthlyMapModel.fromJson(testMap);
    changeStatisticsToggle(0);

    emit(GetDataState());
  }

  changeStatisticsToggle(int index) {

    statisticsIndex = index;
    if (index == 0) {
      weeklyIsSelected = false;
      monthlyIsSelected = false;
      dailyIsSelected = true;
      markers = {};
      if (emotionIndex == 0) {
        dailyMapModel!.happyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        dailyMapModel!.angryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        dailyMapModel!.surprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    }
    if (index == 1) {
      weeklyIsSelected = true;
      monthlyIsSelected = false;
      dailyIsSelected = false;
      markers = {};
      if (weeklyIndex == 0) {
        if (emotionIndex == 0) {
          weeklyMapModel!.firstHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.firstAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.firstSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (weeklyIndex == 1) {
        if (emotionIndex == 0) {
          weeklyMapModel!.secondHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.secondAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.secondSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (weeklyIndex == 2) {
        if (emotionIndex == 0) {
          weeklyMapModel!.thirdHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.thirdAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.thirdSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else {
        if (emotionIndex == 0) {
          weeklyMapModel!.fourthHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.fourthAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.fourthSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      }
    }
    if (index == 2) {
      weeklyIsSelected = false;
      monthlyIsSelected = true;
      dailyIsSelected = false;
      markers = {};
      if (monthlyIndex == 0) {
        if (emotionIndex == 0) {
          monthlyMapModel!.firstHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.firstAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.firstSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (monthlyIndex == 1) {
        if (emotionIndex == 0) {
          monthlyMapModel!.secondHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.secondAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.secondSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else {
        if (emotionIndex == 0) {
          monthlyMapModel!.thirdHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.thirdAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.thirdSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      }
    }

    emit(ChangeToggleTapState());

    if(mapController!=null) {
      print('='*30);
      print(markers.first.position.latitude);
      print('='*30);

      mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
            markers.first.position.latitude, markers.first.position.longitude),
        zoom: 18,
      )));
    }
  }

  changeEmotionToggle(int index) {
    markers = {};
    emotionIndex = index;
    if (statisticsIndex == 0) {
      weeklyIsSelected = false;
      monthlyIsSelected = false;
      dailyIsSelected = true;
      markers = {};
      if (emotionIndex == 0) {
        dailyMapModel!.happyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        dailyMapModel!.angryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        dailyMapModel!.surprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    }
    if (statisticsIndex == 1) {
      weeklyIsSelected = true;
      monthlyIsSelected = false;
      dailyIsSelected = false;
      markers = {};
      if (weeklyIndex == 0) {
        if (emotionIndex == 0) {
          weeklyMapModel!.firstHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.firstAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.firstSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (weeklyIndex == 1) {
        if (emotionIndex == 0) {
          weeklyMapModel!.secondHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.secondAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.secondSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (weeklyIndex == 2) {
        if (emotionIndex == 0) {
          weeklyMapModel!.thirdHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.thirdAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.thirdSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else {
        if (emotionIndex == 0) {
          weeklyMapModel!.fourthHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          weeklyMapModel!.fourthAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          weeklyMapModel!.fourthSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      }
    }
    if (statisticsIndex == 2) {
      weeklyIsSelected = false;
      monthlyIsSelected = true;
      dailyIsSelected = false;
      markers = {};
      if (monthlyIndex == 0) {
        if (emotionIndex == 0) {
          monthlyMapModel!.firstHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.firstAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.firstSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else if (monthlyIndex == 1) {
        if (emotionIndex == 0) {
          monthlyMapModel!.secondHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.secondAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.secondSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      } else {
        if (emotionIndex == 0) {
          monthlyMapModel!.thirdHappyLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else if (emotionIndex == 1) {
          monthlyMapModel!.thirdAngryLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        } else {
          monthlyMapModel!.thirdSurprisedLatLng.forEach((element) {
            markers.add(Marker(
              markerId: MarkerId('${element.latitude},${element.longitude}'),
              icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
              position: LatLng(element.latitude, element.longitude),
            ));
          });
        }
      }
    }

    emit(ChangeToggleTapState());
  }

  changeWeeklyToggle(int index) {
    weeklyIndex = index;
    markers = {};

    if (weeklyIndex == 0) {
      if (emotionIndex == 0) {
        weeklyMapModel!.firstHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        weeklyMapModel!.firstAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        weeklyMapModel!.firstSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    } else if (weeklyIndex == 1) {
      if (emotionIndex == 0) {
        weeklyMapModel!.secondHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        weeklyMapModel!.secondAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        weeklyMapModel!.secondSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    } else if (weeklyIndex == 2) {
      if (emotionIndex == 0) {
        weeklyMapModel!.thirdHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        weeklyMapModel!.thirdAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        weeklyMapModel!.thirdSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    } else {
      if (emotionIndex == 0) {
        weeklyMapModel!.fourthHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        weeklyMapModel!.fourthAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        weeklyMapModel!.fourthSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    }

    emit(ChangeToggleTapState());
  }

  changeMonthlyToggle(int index) {
    monthlyIndex = index;
    markers = {};
    if (monthlyIndex == 0) {
      if (emotionIndex == 0) {
        monthlyMapModel!.firstHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        monthlyMapModel!.firstAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        monthlyMapModel!.firstSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    } else if (monthlyIndex == 1) {
      if (emotionIndex == 0) {
        monthlyMapModel!.secondHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        monthlyMapModel!.secondAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        monthlyMapModel!.secondSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    } else {
      if (emotionIndex == 0) {
        monthlyMapModel!.thirdHappyLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else if (emotionIndex == 1) {
        monthlyMapModel!.thirdAngryLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      } else {
        monthlyMapModel!.thirdSurprisedLatLng.forEach((element) {
          markers.add(Marker(
            markerId: MarkerId('${element.latitude},${element.longitude}'),
            icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
            position: LatLng(element.latitude, element.longitude),
          ));
        });
      }
    }
    emit(ChangeToggleTapState());
  }
}

Map<String, dynamic> testMap = {
  'daily': {
    'angry': [
      {'lng': 30.755358, 'lat': 28.097746},
      {'lng': 30.754912, 'lat': 28.097524},
      {'lng': 28.097888, 'lat': 28.097888},
    ],
    'happy': [
      {'lng': 30.754540, 'lat': 28.098924},
      {'lng': 30.754284, 'lat': 28.099064},
      {'lng': 30.755174, 'lat': 28.099319},
    ],
    'surprised': [
      {'lng': 30.753938, 'lat': 28.099755},
      {'lng': 30.754407, 'lat': 28.099561},
      {'lng': 30.754686, 'lat': 28.099665},
    ],
  },
  'weekly': {
    'first': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
    'second': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
    'third': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
    'fourth': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
  },
  'monthly': {
    'first': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
    'second': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
    'third': {
      'angry': [
        {'lng': 30.755358, 'lat': 28.097746},
        {'lng': 30.754912, 'lat': 28.097524},
        {'lng': 28.097888, 'lat': 28.097888},
      ],
      'happy': [
        {'lng': 30.754540, 'lat': 28.098924},
        {'lng': 30.754284, 'lat': 28.099064},
        {'lng': 30.755174, 'lat': 28.099319},
      ],
      'surprised': [
        {'lng': 30.753938, 'lat': 28.099755},
        {'lng': 30.754407, 'lat': 28.099561},
        {'lng': 30.754686, 'lat': 28.099665},
      ],
    },
  }
};
