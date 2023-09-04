class TaskModel
{
  String id ;
  String tittle ;
  String note ;
  String startTime ;
  String endTime ;
  bool isCompleted ;
  int colorIndex;

  TaskModel({required this.startTime,required this.endTime,required this.note,required this.id,
  required this.colorIndex,required this.isCompleted,required this.tittle});

 static  List<TaskModel> taskModelItem = [
   TaskModel(startTime: '10:00 PM',
       endTime: '11:00 PM',
       note: 'hello philo',
       id: '1',
       colorIndex: 5,
       isCompleted: false,
       tittle: 'philo'),
   TaskModel(startTime: '11:00 PM',
       endTime: '12:00 PM',
       note: 'hello philo',
       id: '2',
       colorIndex: 4,
       isCompleted: false,
       tittle: 'philo'),
   TaskModel(startTime: '19:00 PM',
       endTime: '20:00 PM',
       note: 'hello philo',
       id: '3',
       colorIndex: 5,
       isCompleted: true,
       tittle: 'philo')
 ];
}