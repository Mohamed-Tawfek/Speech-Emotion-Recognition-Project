class AnalysisResultModel {
  String? result;
  AnalysisResultModel.fromJson(Map<String, dynamic> json) {
    String r = json['emotion'];

    if (r == 'Neutral') {
      result = 'Natural';
    } else if (r == 'Disgust') {
      result = 'Disgusted';
    } else if (r == 'Surprise') {
      result = 'Surprised';
    } else {
      result = r;
    }
  }
}
