import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';
import '../config.dart';

final appRoutes = [
   GoRoute(
     path: RouteLocation.home,
     parentNavigatorKey: navigationKey,
     builder: HomeScreen.builder,
   ),
   GoRoute(
     path: RouteLocation.addTodo,
     parentNavigatorKey: navigationKey,
     builder: AddTodoScreen.builder,
   ),
 ];