import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'beneficio_model.dart';
export 'beneficio_model.dart';

class BeneficioWidget extends StatefulWidget {
  const BeneficioWidget({
    Key? key,
    this.beneficio,
  }) : super(key: key);

  final dynamic beneficio;

  @override
  _BeneficioWidgetState createState() => _BeneficioWidgetState();
}

class _BeneficioWidgetState extends State<BeneficioWidget> {
  late BeneficioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeneficioModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 32.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 14.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 0.0, 0.0),
                      child: Text(
                        getJsonField(
                          widget.beneficio,
                          r'''$.titulo''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.beneficio,
                            r'''$.subTitulo''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final lvTopicos = getJsonField(
                                widget.beneficio,
                                r'''$.topicos''',
                              ).toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 0.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: lvTopicos.length,
                                itemBuilder: (context, lvTopicosIndex) {
                                  final lvTopicosItem =
                                      lvTopicos[lvTopicosIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (getJsonField(
                                              widget.beneficio,
                                              r'''$.titulo''',
                                            ) ==
                                            _model.auxBolsa) {
                                          if ((lvTopicosIndex == 0) ||
                                              (lvTopicosIndex == 4) ||
                                              (lvTopicosIndex == 3) ||
                                              (lvTopicosIndex == 5)) {
                                            context.pushNamed(
                                              'TopicoBeneficio',
                                              queryParameters: {
                                                'topico': serializeParam(
                                                  lvTopicosItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          } else if (lvTopicosIndex == 2) {
                                            context.pushNamed(
                                              'CalendarioBeneficio',
                                              queryParameters: {
                                                'titulo': serializeParam(
                                                  'Data de pagamento',
                                                  ParamType.String,
                                                ),
                                                'beneficio': serializeParam(
                                                  'bolsa',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          } else {
                                            context.pushNamed(
                                              'AvisoConsulta',
                                              queryParameters: {
                                                'topicoNis': serializeParam(
                                                  getJsonField(
                                                    widget.beneficio,
                                                    r'''$.topicos[5]''',
                                                  ),
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          }
                                        } else if (getJsonField(
                                              widget.beneficio,
                                              r'''$.titulo''',
                                            ) ==
                                            _model.auxProuni) {
                                          if (lvTopicosIndex < 3) {
                                            context.pushNamed(
                                              'TopicoBeneficio',
                                              queryParameters: {
                                                'topico': serializeParam(
                                                  lvTopicosItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          } else {
                                            context.pushNamed(
                                              'CalendarioBeneficio',
                                              queryParameters: {
                                                'titulo': serializeParam(
                                                  'Data de inscrições',
                                                  ParamType.String,
                                                ),
                                                'beneficio': serializeParam(
                                                  'prouni',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            return;
                                          }
                                        } else {
                                          context.pushNamed(
                                            'TopicoBeneficio',
                                            queryParameters: {
                                              'topico': serializeParam(
                                                lvTopicosItem,
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );

                                          return;
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: 150.0,
                                          height: 135.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  getJsonField(
                                                    lvTopicosItem,
                                                    r'''$.imagem''',
                                                  ),
                                                  width: 48.0,
                                                  height: 48.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 25.0, 20.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    lvTopicosItem,
                                                    r'''$.titulo''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
