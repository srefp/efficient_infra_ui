class Course {
  int id;
  String name;
  String room;
  int dayOfWeek;
  int startSection;
  int endSection;

  int get sectionNum => endSection - startSection + 1;

  Course({
    required this.id,
    required this.name,
    required this.room,
    required this.dayOfWeek,
    required this.startSection,
    required this.endSection,
  });
}

extension CourseListExtension on List<Course> {
  Course? getByRowAndCol({required int row, required int column}) {
    List<Course> list = this
        .where((e) => e.dayOfWeek == column && e.startSection == row)
        .toList();
    if (list.isEmpty) {
      return null;
    } else {
      return list.first;
    }
  }
}
