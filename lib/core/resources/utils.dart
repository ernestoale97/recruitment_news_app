import 'package:intl/intl.dart';

class Utils {
  static String convertToAgo(String? dateTime) {
    try {
      if(dateTime == null) {
        return "";
      }
       DateTime input =
      DateFormat('yyyy-MM-DDTHH:mm:ssZ').parse(dateTime, true);
      Duration diff = DateTime.now().difference(input);

      if (diff.inDays >= 1) {
        return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
      } else {
        return 'just now';
      }
    } catch(_) {
      return dateTime ?? "";
    }
  }
}