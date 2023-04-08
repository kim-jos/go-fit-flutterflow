import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Builder(
          builder: (context) {
            final promotionImageList = widget.contentUrls?.toList() ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: promotionImageList.length,
              itemBuilder: (context, promotionImageListIndex) {
                final promotionImageListItem =
                    promotionImageList[promotionImageListIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                  child: Image.network(
                    promotionImageListItem,
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 400.0,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
