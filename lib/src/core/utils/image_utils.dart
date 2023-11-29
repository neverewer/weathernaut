import 'package:l/l.dart';
import 'package:weathernaut/src/core/utils/constants/strings.dart';
import 'package:weathernaut/src/core/utils/date_time_utils.dart';

sealed class ImageUtils {
  @Deprecated('Uses getImagePathFromCode')
  static String getIconPathFromUrl(String url) {
    final List<String> parts = url.split("/");
    final result = "${parts[parts.length - 2]}/${parts[parts.length - 1]}";
    return result;
  }

  static final Map<int, String> conditionCodeToImageName = {
    1000: '01',
    1003: '02',
    1006: '02',
    1009: '02',
    1030: '07',
    1035: '07',
    1147: '07',
    1063: '03',
    1072: '03',
    1150: '03',
    1153: '03',
    1168: '03',
    1171: '03',
    1180: '03',
    1183: '03',
    1186: '03',
    1189: '03',
    1192: '03',
    1195: '03',
    1198: '03',
    1201: '03',
    1240: '03',
    1243: '03',
    1246: '03',
    1066: '04',
    1069: '04',
    1114: '04',
    1117: '04',
    1204: '04',
    1207: '04',
    1210: '04',
    1213: '04',
    1216: '04',
    1219: '04',
    1222: '04',
    1225: '04',
    1237: '04',
    1255: '04',
    1258: '04',
    1249: '05',
    1252: '05',
    1261: '05',
    1264: '05',
    1087: '06',
    1273: '06',
    1276: '06',
    1279: '06',
    1282: '06',
  };

  /// Returns the image path based on the condition code of api
  static String getImagePathFromCode({required int conditionCode, int? isDay}) {
    try {
      final markOfDay = isDay != null ? DateTimeUtils.getMarkOfDay(isDay) : 'd';
      final imageName = conditionCodeToImageName[conditionCode];

      if (imageName == null) {
        l.w('No image found for $conditionCode');
        return '${weatherImagePath}01$markOfDay.png';
      }

      return '$weatherImagePath$imageName$markOfDay.png';
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
