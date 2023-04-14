import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_page_promotion_model.dart';
export 'home_page_promotion_model.dart';

class HomePagePromotionWidget extends StatefulWidget {
  const HomePagePromotionWidget({
    Key? key,
    this.contentUrls,
  }) : super(key: key);

  final List<String>? contentUrls;

  @override
  _HomePagePromotionWidgetState createState() =>
      _HomePagePromotionWidgetState();
}

class _HomePagePromotionWidgetState extends State<HomePagePromotionWidget> {
  late HomePagePromotionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePagePromotionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('HOME_PROMOTION_BUTTON_BTN_ON_TAP');
                      logFirebaseEvent('Button_share');
                      await Share.share(
                        'gofit://gofit.com${GoRouter.of(context).location}',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Pretendard',
                                color: Colors.white,
                                useGoogleFonts: false,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final promotionImageList = widget.contentUrls?.toList() ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(promotionImageList.length,
                        (promotionImageListIndex) {
                      final promotionImageListItem =
                          promotionImageList[promotionImageListIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: Image.network(
                          promotionImageListItem,
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 400.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
