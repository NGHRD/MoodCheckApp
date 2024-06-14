class Utilities {
  String getCurrentDate() {
    final String day = DateTime.now().day.toString();
    late String month;
    final String year = DateTime.now().year.toString();

    switch (DateTime.now().month) {
      case 1:
        month = "jannuari";
      case 2:
        month = "feburari";
      case 3:
        month = "maart";
      case 4:
        month = "april";
      case 5:
        month = "mei";
      case 6:
        month = "juni";
      case 7:
        month = "juli";
      case 8:
        month = "augustus";
      case 9:
        month = "september";
      case 10:
        month = "oktober";
      case 11:
        month = "november";
      case 12:
        month = "december";
    }
    return "$day $month $year";
  }
}