import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  Local state fields for this page.

  String mesSelecionado = '';

  List<String> datas = [];
  void addToDatas(String item) => datas.add(item);
  void removeFromDatas(String item) => datas.remove(item);
  void removeAtIndexFromDatas(int index) => datas.removeAt(index);
  void insertAtIndexInDatas(int index, String item) =>
      datas.insert(index, item);
  void updateDatasAtIndex(int index, Function(String) updateFn) =>
      datas[index] = updateFn(datas[index]);

  List<String> informacoes = [];
  void addToInformacoes(String item) => informacoes.add(item);
  void removeFromInformacoes(String item) => informacoes.remove(item);
  void removeAtIndexFromInformacoes(int index) => informacoes.removeAt(index);
  void insertAtIndexInInformacoes(int index, String item) =>
      informacoes.insert(index, item);
  void updateInformacoesAtIndex(int index, Function(String) updateFn) =>
      informacoes[index] = updateFn(informacoes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
