
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

navTo(BuildContext context, String route){
  GoRouter.of(context).go(route);
}

pushPage(BuildContext context, String route){
  GoRouter.of(context).push(route);
}