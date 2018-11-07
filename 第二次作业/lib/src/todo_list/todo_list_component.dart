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
  int boy;

  var namelist ={
    10164507101:'李典康',
    10164507102:'陈瑶',
    10164507103:'周嘉翔',
    10164507104:'龙晶毅',
    10164507105:'郑可欣',
    10164507106:'张静雅',
    10164507107:'戚晓颖',
    10164507108:'蔡心蕊',
    10164507109:'朱子恒',
    10164507110:'赵世宇',
    10164507111:'吴松二',
    10164507112:'唐莉文',
  };

  var counter=[0,0,0,0,0,0,0,0,0,0,0,0,0];
  var record="";

  void initCounter(){
    for (var i = 0; i < 13; i++) {
      counter[i]=0;
    }

  }

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
    boy=0;
    initCounter();
    getRandom();
    var i=boy+1;
    record=i.toString();
  }
  void add() {
    items.add(newTodo);
    newTodo = '';
  }


  void getRandom() {
  var i;
  var random = Random();
  do i=random.nextInt(13);
  while(i==boy);
  this.boy =i; // Between 0 and 12.
  counter[i]++;//catch select
  var s;
  i=boy+1;
  s=i.toString();
  querySelector('#output').text="学号："+s;
}

void getNew(){
  var min=100000000000;
  for(int i=0;i<13;i++){
if(counter[i]<min){
  min=counter[i];
}
  }
  var p;
  var random = Random();
  do p=random.nextInt(13);
  while(counter[p]!=min);
  boy=p;
  counter[p]++;
  var s;
  p=boy+1;
  s=p.toString();
  querySelector('#output').text="学号："+s;
  record=record+','+s;
}

void again(){
  getRandom();
  var i=boy+1;
  record=record+','+i.toString();
}

String getName(){
  return namelist[boy];
}

void showName(){
querySelector('#name').text="姓名："+getName();
}

}

   
 