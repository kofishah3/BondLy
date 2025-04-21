class Plan {
  final String title;
  final String month;
  final String day;
  final String year;
  final String category;
  final List<String> people;

  Plan(
    {
      required this.title,
      required this.month,
      required this.day,
      required this.year,
      required this.category,
      required this.people
    }
  );
}