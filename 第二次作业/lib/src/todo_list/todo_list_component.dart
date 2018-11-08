import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'todo_list_service.dart';  
@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
   MaterialButtonComponent,
   MaterialInputComponent,
   NgFor,
  ],
 providers: [const ClassProvider(TodoListService)],
)


class TodoListComponent implements OnInit {
  TodoListService todoListService;
  List<String> items = [];
  String newTodo = '';

  TodoListComponent(this.todoListService);
  int stu;

  var namelist ={
    0:'李典康',
    1:'陈瑶',
    2:'周嘉翔',
    3:'龙晶毅',
    4:'郑可欣',
    5:'张静雅',
    6:'戚晓颖',
    7:'蔡心蕊',
    8:'朱子恒',
    9:'赵世宇',
    10:'吴松二',
    11:'唐莉文',
  };

  var counter=[0,0,0,0,0,0,0,0,0,0,0,0,0];

  void initCounter(){
    for (var i = 0; i < 13; i++) {
      counter[i]=0;
    }

  }

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
    stu=0;
    initCounter();
    getRandom();
    var i=stu+1;
  }
  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  void getRandom() {
  var i;
  var random = Random();
  do i=random.nextInt(13);
  while(i==stu);
  this.stu =i; 
  counter[i]++;
  var s;
  i=stu+1;
  s=i.toString();
  querySelector('#output').text="学号为"+s;
}

void getNew(){
  var min=10000;
  for(int i=0;i<13;i++){
if(counter[i]<min){
  min=counter[i];
}
  }
  var p;
  var random = Random();
  do p=random.nextInt(13);
  while(counter[p]!=min);
  stu=p;
  counter[p]++;
  var s;
  p=stu+1;
  s=p.toString();
  querySelector('#output').text="学号为"+s;
}

void select(){
  getRandom();
  var i=stu+1;
}

String getName(){
  return namelist[stu];
}

void showName(){
querySelector('#name').text="姓名："+getName();
}

}

   
 