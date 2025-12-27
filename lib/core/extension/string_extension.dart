// class to create extension for String
extension StringExtension on String {
  //method to get the initial (eg: ram -> R)
  String get getInitial {
    String value = this;
    if (value.isNotEmpty) {
      String initial = value[0].toUpperCase();
      return initial;
    }
    return '';
  }

  //method to get the lastSeen (eg: 2025-12-27 14:26:00 -> 2 min ago|| online || yesterday like that..)

  String toLastSeen() {
    final DateTime input = DateTime.parse(this).toLocal();

    final DateTime now = DateTime.now();

    final DateTime inputTrimmed = DateTime(
      input.year,
      input.month,
      input.day,
      input.hour,
      input.minute,
    );

    final DateTime nowTrimmed = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    );

    final Duration diff = nowTrimmed.difference(inputTrimmed);

    final int minutes = diff.inMinutes;
    final int hours = diff.inHours;
    final int days = diff.inDays;

    if (minutes <= 1) {
      return 'Online';
    } else if (minutes < 60) {
      return '$minutes min ago';
    } else if (hours < 24) {
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    } else if (days == 1) {
      return 'Yesterday';
    } else if (days <= 5) {
      return '$days days ago';
    } else {
      return _formatDate(inputTrimmed);
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  //method to check user online (eg: 2025-12-27 14:26:00 -> true || false)

  bool get isOnline {
    final DateTime lastSeenTime = DateTime.parse(this).toLocal();
    final DateTime now = DateTime.now();

    final DateTime lastSeenTrimmed = DateTime(
      lastSeenTime.year,
      lastSeenTime.month,
      lastSeenTime.day,
      lastSeenTime.hour,
      lastSeenTime.minute,
    );

    final DateTime nowTrimmed = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    );

    final int diffInMinutes = nowTrimmed.difference(lastSeenTrimmed).inMinutes;

    return diffInMinutes <= 1;
  }
}
