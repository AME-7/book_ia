import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushReplacment(BuildContext context, String route) {
  context.pushReplacement(route);
}

void pushTo(BuildContext context, String route) {
  context.push(route);
}

void pushToBase(BuildContext context, String route) {
  context.go(route);
}

void pop(BuildContext context) {
  context.pop();
}
