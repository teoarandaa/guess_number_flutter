
class Mark {
  final int score;
  final DateTime dateTime;

  Mark({
    required this.score, 
    required this.dateTime
  });

  String get formattedDateTime {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
} 