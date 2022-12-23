import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: SpinKitRing(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 40,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'AuthEmailLogin': (data) async => AuthEmailLoginWidget(),
  'AuthLogin': (data) async => AuthLoginWidget(),
  'ClassDetails': (data) async => ClassDetailsWidget(
        classRef: getParameter(data, 'classRef'),
        className: getParameter(data, 'className'),
        maxLimit: getParameter(data, 'maxLimit'),
        exerciseType: getParameter(data, 'exerciseType'),
        image: getParameter(data, 'image'),
      ),
  'MyReservations': (data) async => MyReservationsWidget(),
  'ChatGroups': (data) async => NavBarPage(initialPage: 'ChatGroups'),
  'Settings': (data) async => NavBarPage(initialPage: 'Settings'),
  'Chat': (data) async => ChatWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
        chatUserList: [],
      ),
  'ChatCreateGroup': (data) async => ChatCreateGroupWidget(),
  'ReservationComplete': (data) async => ReservationCompleteWidget(),
  'ChatAddUser': (data) async => ChatAddUserWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
  'Feedback': (data) async => FeedbackWidget(),
  'TermsOfService': (data) async => TermsOfServiceWidget(),
  'Subscriptions': (data) async => SubscriptionsWidget(),
  'SubscriptionsCopy': (data) async => SubscriptionsCopyWidget(),
  'SubscriptionsBraintree': (data) async => SubscriptionsBraintreeWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
