import '../backend/braintree/payment_manager.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionsBraintreeWidget extends StatefulWidget {
  const SubscriptionsBraintreeWidget({Key? key}) : super(key: key);

  @override
  _SubscriptionsBraintreeWidgetState createState() =>
      _SubscriptionsBraintreeWidgetState();
}

class _SubscriptionsBraintreeWidgetState
    extends State<SubscriptionsBraintreeWidget> {
  String? transactionId;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SubscriptionsBraintree'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('SUBSCRIPTIONS_BRAINTREE_arrow_back_round');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'aiu94a4j' /* 멤버십 가입 */,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'leske57f' /* 멤버십 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'SUBSCRIPTIONS_BRAINTREE_Container_ov9ghv');
                        logFirebaseEvent('Container_braintree_payment');
                        final transacAmount = 79000.0;
                        if (!(creditCardFormKey.currentState?.validate() ??
                            false)) {
                          return;
                        }
                        if (kIsWeb) {
                          showSnackbar(
                              context, 'Payments not yet supported on web.');
                          return;
                        }

                        final cardRequest = BraintreeCreditCardRequest(
                          cardNumber: creditCardInfo.cardNumber,
                          expirationMonth:
                              creditCardInfo.expiryDate.split('/').first,
                          expirationYear:
                              creditCardInfo.expiryDate.split('/').last,
                          cvv: creditCardInfo.cvvCode,
                        );
                        final cardResult = await Braintree.tokenizeCreditCard(
                          braintreeClientToken(),
                          cardRequest,
                        );
                        if (cardResult == null) {
                          return;
                        }
                        showSnackbar(
                          context,
                          'Processing payment...',
                          duration: 10,
                          loading: true,
                        );
                        final paymentResponse = await processBraintreePayment(
                          transacAmount,
                          cardResult.nonce,
                        );
                        if (paymentResponse.errorMessage != null) {
                          showSnackbar(context,
                              'Error: ${paymentResponse.errorMessage}');
                          return;
                        }
                        showSnackbar(context, 'Success!');
                        transactionId = paymentResponse.transactionId!;

                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x34111417),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 24, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0cqj9cii' /* Standard 멤버십 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6p90515e' /* 79,000만원 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 24, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'r856f6z8' /* 프리미엄 수업 4회권 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'SUBSCRIPTIONS_BRAINTREE_Container_n8kuos');
                        logFirebaseEvent('Container_launch_u_r_l');
                        await launchURL('https://payapplite.com/l/HMsJLU');
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x34111417),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 24, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'y9050exe' /* Lite 멤버십 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zkxlm8gt' /* 42,000만원 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 24, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'apuxokpb' /* 프리미엄 수업 2회권 */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: FlutterFlowCreditCardForm(
                  formKey: creditCardFormKey,
                  creditCardModel: creditCardInfo,
                  obscureNumber: true,
                  obscureCvv: false,
                  spacing: 10,
                  textStyle: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  inputDecoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9E9E9E),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9E9E9E),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
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
