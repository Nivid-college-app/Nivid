import 'package:intl/intl.dart';

String convertDateToReadableString(DateTime time) {
  final currentTime = DateTime.now();
  return currentTime.difference(time) < Duration(minutes: 1)
      ? 'Just now'
      : currentTime.difference(time) >= Duration(minutes: 1) &&
              currentTime.difference(time) < Duration(minutes: 2)
          ? '1 minute ago'
          : currentTime.difference(time) < Duration(hours: 1)
              ? currentTime.difference(time).inMinutes.toString() +
                  ' minutes ago'
              : currentTime.difference(time) >= Duration(hours: 1) &&
                      currentTime.difference(time) < Duration(hours: 2)
                  ? '1 hour ago'
                  : currentTime.difference(time) < Duration(hours: 24)
                      ? currentTime.difference(time).inHours.toString() +
                          ' hours ago'
                      : currentTime.difference(time) >= Duration(days: 1) &&
                              currentTime.difference(time) < Duration(days: 2)
                          ? '1 day ago'
                          : currentTime.difference(time) < Duration(days: 7)
                              ? currentTime.difference(time).inDays.toString() +
                                  ' days ago'
                              : currentTime.difference(time) >=
                                          Duration(days: 7) &&
                                      currentTime.difference(time) <
                                          Duration(days: 14)
                                  ? '1 week ago'
                                  : '${DateFormat('d MMMM yyyy').format(time)}';
}
