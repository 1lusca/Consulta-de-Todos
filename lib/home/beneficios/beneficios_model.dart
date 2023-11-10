import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'beneficios_widget.dart' show BeneficiosWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeneficiosModel extends FlutterFlowModel<BeneficiosWidget> {
  ///  Local state fields for this page.

  List<String> menuBeneficios = [];
  void addToMenuBeneficios(String item) => menuBeneficios.add(item);
  void removeFromMenuBeneficios(String item) => menuBeneficios.remove(item);
  void removeAtIndexFromMenuBeneficios(int index) =>
      menuBeneficios.removeAt(index);
  void insertAtIndexInMenuBeneficios(int index, String item) =>
      menuBeneficios.insert(index, item);
  void updateMenuBeneficiosAtIndex(int index, Function(String) updateFn) =>
      menuBeneficios[index] = updateFn(menuBeneficios[index]);

  String itemSelecionado = 'Populares';

  List<String> beneficios = [];
  void addToBeneficios(String item) => beneficios.add(item);
  void removeFromBeneficios(String item) => beneficios.remove(item);
  void removeAtIndexFromBeneficios(int index) => beneficios.removeAt(index);
  void insertAtIndexInBeneficios(int index, String item) =>
      beneficios.insert(index, item);
  void updateBeneficiosAtIndex(int index, Function(String) updateFn) =>
      beneficios[index] = updateFn(beneficios[index]);

  List<String> imagens = [];
  void addToImagens(String item) => imagens.add(item);
  void removeFromImagens(String item) => imagens.remove(item);
  void removeAtIndexFromImagens(int index) => imagens.removeAt(index);
  void insertAtIndexInImagens(int index, String item) =>
      imagens.insert(index, item);
  void updateImagensAtIndex(int index, Function(String) updateFn) =>
      imagens[index] = updateFn(imagens[index]);

  bool mostraAviso = false;

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
