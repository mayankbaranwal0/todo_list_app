import 'package:equatable/equatable.dart';

import '../data/data.dart';

class TodoState extends Equatable {
   final List<Todo> todos;
 
   const TodoState({
     required this.todos,
   });
   const TodoState.initial({
     this.todos = const [],
   });
 
   TodoState copyWith({
     List<Todo>? todos,
   }) {
     return TodoState(
       todos: todos ?? this.todos,
     );
   }
 
   @override
   List<Object> get props => [todos];
 }