import 'models/gerencia_de_estado.dart';
import 'package:flutter/material.dart';

class BuilderWidget<T> extends StatefulWidget {
  final GerenciaDeEstado<T> controller;
  final Function(BuildContext context, T state) builder;
  BuilderWidget({required this.controller, required this.builder});

  @override
  _BuilderWidget<T> createState() => _BuilderWidget<T>();
}

class _BuilderWidget<T> extends State<BuilderWidget<T>> {
  @override
  void initState() {
    widget.controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
