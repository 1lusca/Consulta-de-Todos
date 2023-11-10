import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'artigo_model.dart';
export 'artigo_model.dart';

class ArtigoWidget extends StatefulWidget {
  const ArtigoWidget({
    Key? key,
    this.artigo,
  }) : super(key: key);

  final dynamic artigo;

  @override
  _ArtigoWidgetState createState() => _ArtigoWidgetState();
}

class _ArtigoWidgetState extends State<ArtigoWidget> {
  late ArtigoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtigoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tags = functions.setListaTagsBlog().toList().cast<String>();
        _model.tagsId = functions.setListaTagsIdBlog().toList().cast<String>();
      });
    });
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
              SingleChildScrollView(
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: getJsonField(
                              widget.artigo,
                              r'''$._embedded["wp:featuredmedia"][0].source_url''',
                            ),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 20.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 32.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: FaIcon(
                                FontAwesomeIcons.chevronLeft,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 14.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: () {
                              if (_model.tagsId.contains(getJsonField(
                                    widget.artigo,
                                    r'''$.tags[0]''',
                                  ).toString()) ==
                                  true) {
                                return _model.tags[functions.getIndex(
                                    _model.tagsId.toList(),
                                    getJsonField(
                                      widget.artigo,
                                      r'''$.tags[0]''',
                                    ).toString())];
                              } else if (_model.tagsId.contains(getJsonField(
                                    widget.artigo,
                                    r'''$.tags[1]''',
                                  ).toString()) ==
                                  true) {
                                return _model.tags[functions.getIndex(
                                    _model.tagsId.toList(),
                                    getJsonField(
                                      widget.artigo,
                                      r'''$.tags[1]''',
                                    ).toString())];
                              } else if (_model.tagsId.contains(getJsonField(
                                    widget.artigo,
                                    r'''$.tags[2]''',
                                  ).toString()) ==
                                  true) {
                                return _model.tags[functions.getIndex(
                                    _model.tagsId.toList(),
                                    getJsonField(
                                      widget.artigo,
                                      r'''$.tags[2]''',
                                    ).toString())];
                              } else {
                                return 'Recentes';
                              }
                            }(),
                            options: FFButtonOptions(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          Text(
                            functions.setDataEscrita(getJsonField(
                              widget.artigo,
                              r'''$.date''',
                            ).toString()),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        getJsonField(
                          widget.artigo,
                          r'''$.title.rendered''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 30.0),
                      child: Html(
                        data: functions.formataTexto(functions.divideTexto(
                            getJsonField(
                              widget.artigo,
                              r'''$.content.rendered''',
                            ).toString(),
                            1)),
                      ),
                    ),
                    if (functions.textoContemLinks(getJsonField(
                          widget.artigo,
                          r'''$.content.rendered''',
                        ).toString()) ==
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Text(
                          'Veja Também:',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    if (functions.textoContemLinks(getJsonField(
                          widget.artigo,
                          r'''$.content.rendered''',
                        ).toString()) ==
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final lvVejaTambem = functions
                                .getTextoLinksArtigo(getJsonField(
                                  widget.artigo,
                                  r'''$.content.rendered''',
                                ).toString())
                                .toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: lvVejaTambem.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, lvVejaTambemIndex) {
                                final lvVejaTambemItem =
                                    lvVejaTambem[lvVejaTambemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.getArtigoResult =
                                        await BlogGroup.getArtigoCall.call(
                                      slug: functions.getLinkSlug(functions
                                          .getUrlLinksArtigo(widget.artigo!
                                              .toString())[lvVejaTambemIndex]),
                                    );
                                    if ((_model.getArtigoResult?.succeeded ??
                                        true)) {
                                      context.pushNamed(
                                        'Artigo',
                                        queryParameters: {
                                          'artigo': serializeParam(
                                            getJsonField(
                                              (_model.getArtigoResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$[0]''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Houve um erro ao buscar a notícia. Desculpe pelo incômodo!',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: Text(
                                    lvVejaTambemItem,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                  ),
                                );
                              },
                              controller: _model.listViewController,
                            );
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                      child: Html(
                        data: functions.formataTexto(functions.divideTexto(
                            getJsonField(
                              widget.artigo,
                              r'''$.content.rendered''',
                            ).toString(),
                            2)),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 50.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 32.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.chevronUp,
                      color: Colors.white,
                      size: 14.0,
                    ),
                    onPressed: () async {
                      await _model.columnController?.animateTo(
                        0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
