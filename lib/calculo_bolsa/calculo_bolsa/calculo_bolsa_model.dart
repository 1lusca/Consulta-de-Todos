import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calculo_bolsa_widget.dart' show CalculoBolsaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculoBolsaModel extends FlutterFlowModel<CalculoBolsaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ddNumeroMembros widget.
  String? ddNumeroMembrosValue;
  FormFieldController<String>? ddNumeroMembrosValueController;
  // State field(s) for tfRenda widget.
  FocusNode? tfRendaFocusNode;
  TextEditingController? tfRendaController;
  String? Function(BuildContext, String?)? tfRendaControllerValidator;
  String? _tfRendaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for ddMembros7 widget.
  String? ddMembros7Value;
  FormFieldController<String>? ddMembros7ValueController;
  // State field(s) for ddMembros18 widget.
  String? ddMembros18Value;
  FormFieldController<String>? ddMembros18ValueController;
  // State field(s) for ddGravida widget.
  String? ddGravidaValue;
  FormFieldController<String>? ddGravidaValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tfRendaControllerValidator = _tfRendaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tfRendaFocusNode?.dispose();
    tfRendaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
