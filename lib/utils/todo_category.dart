import 'package:flutter/material.dart';

enum TodoCategory {
   personal(Icons.book, Colors.lightBlue),
   work(Icons.emoji_events, Colors.amber),
   others(Icons.calendar_month_rounded, Colors.purple);
 
   static TodoCategory stringToTodoCategory(String name) {
     try {
       return TodoCategory.values.firstWhere(
         (category) => category.name == name,
       );
     } catch (e) {
       return TodoCategory.others;
     }
   }
 
   final IconData icon;
   final Color color;
   const TodoCategory(this.icon, this.color);
 }