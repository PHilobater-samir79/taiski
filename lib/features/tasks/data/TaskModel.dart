class TaskModel {
  final int? id ;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final int isCompleted ;
  final int colorIndex;

  TaskModel(
      {
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.note,
      this.id ,
      required this.colorIndex,
      required this.isCompleted,
      required this.title});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'] ,
        date: json['date'] ,
        startTime: json['startTime'] ,
        endTime: json['endTime'] ,
        note: json['note'] ,
        colorIndex: json['colorIndex'] ,
        isCompleted: json['isCompleted']  ,
        title: json['title'] 
        );
  }
}
