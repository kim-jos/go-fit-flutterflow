import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
  }) =>
      [koText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // AuthEmailLogin
  {
    'u7sd5fe4': {
      'ko': 'Go Fit',
      'en': '',
    },
    'mrjn4nw8': {
      'ko': '로그인',
      'en': 'Login',
    },
    'lwr4upm4': {
      'ko': '',
      'en': 'Email Address',
    },
    'sm6kkgm0': {
      'ko': '이메일',
      'en': 'Enter your email...',
    },
    'uaptgtcu': {
      'ko': '',
      'en': '',
    },
    'nmslv0cc': {
      'ko': '비밀번호',
      'en': 'Enter your password...',
    },
    'lbwr7onm': {
      'ko': '로그인',
      'en': 'Login',
    },
    'qdypelx9': {
      'ko': '비밀번호 찾기',
      'en': '',
    },
    'beorv1g4': {
      'ko': '먼저 둘러보기',
      'en': 'Continue without logging in',
    },
    '1lyvfoko': {
      'ko': '회원가입',
      'en': 'Sign Up',
    },
    'v2n03fwl': {
      'ko': '이름',
      'en': 'Name',
    },
    'pq9r0zt0': {
      'ko': '전화번호',
      'en': 'Phone Number',
    },
    'h8ot3s4k': {
      'ko': '이메일',
      'en': '',
    },
    'u3t9zbc8': {
      'ko': '비밀번호',
      'en': '',
    },
    'untvo2lq': {
      'ko': '비밀번호 확인',
      'en': 'Confirm Password',
    },
    'celr4qfk': {
      'ko': '회원가입',
      'en': '',
    },
    'kc9iznkl': {
      'ko': 'Home',
      'en': '',
    },
  },
  // AuthLogin
  {
    '196371zp': {
      'ko': 'Go Fit',
      'en': '',
    },
    '9t8b8ezy': {
      'ko': '로그인',
      'en': 'Login',
    },
    'qwglaxrp': {
      'ko': '구글 로그인',
      'en': 'Sign in with Google',
    },
    'zwoheq92': {
      'ko': '애플 로그인',
      'en': 'Sign in with Apple',
    },
    'f2xay9l9': {
      'ko': '이메일 로그인',
      'en': 'Email Login',
    },
    '4scdlrn6': {
      'ko': '먼저 둘러보기',
      'en': 'Continue without logging in',
    },
    'q34ek0kh': {
      'ko': '회원가입',
      'en': 'Sign Up',
    },
    'sh0xuws4': {
      'ko': '구글 회원가입',
      'en': 'Sign up with Google',
    },
    'd33hhv9s': {
      'ko': '애플 회원가입',
      'en': 'Sign up with Apple',
    },
    'd3532eyn': {
      'ko': '이메일 회원가입',
      'en': 'Sign up with Email',
    },
    '45w6tqv2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MyReservations
  {
    'cvfu770k': {
      'ko': '최신',
      'en': 'Most Recent',
    },
    'gwavr9ay': {
      'ko': '예약현황',
      'en': 'My Reservations',
    },
    'rtdplk0h': {
      'ko': 'Home',
      'en': '',
    },
  },
  // ClassDetails
  {
    'kj9uvxm7': {
      'ko': '수업 유형',
      'en': '',
    },
    'njp96srb': {
      'ko': '소요 시간',
      'en': '',
    },
    'p9p3nl8a': {
      'ko': '수업 준비물',
      'en': '',
    },
    'ra6ymp6e': {
      'ko': '기타',
      'en': '',
    },
    '7am1in47': {
      'ko': '예약하기',
      'en': '',
    },
  },
  // Classes
  {
    '07c0oj65': {
      'ko': '',
      'en': '',
    },
    'o0sej5yi': {
      'ko': '검색',
      'en': 'Search',
    },
    'vpp8litr': {
      'ko': '운동시설',
      'en': 'Fitness Centers',
    },
    '4v43t5yc': {
      'ko': '운동시설',
      'en': 'Fitness',
    },
  },
  // Settings
  {
    'amv6f82u': {
      'ko': '내 계정',
      'en': 'Account Settings',
    },
    '3y491idk': {
      'ko': '예약현황',
      'en': 'My Reservations',
    },
    'zt2qicvo': {
      'ko': '멤버십 구매',
      'en': '',
    },
    'wuo3ru0i': {
      'ko': '이용약관',
      'en': 'Terms of Service',
    },
    'n6ejduc0': {
      'ko': '보유 크레딧',
      'en': 'Remaining Credits',
    },
    'mqz45pq4': {
      'ko': '[User Name]',
      'en': '',
    },
    'zilqow9t': {
      'ko': '[username@domain.com]',
      'en': '',
    },
    'szdy40va': {
      'ko': '내정보',
      'en': 'My Profile',
    },
  },
  // ReservationComplete
  {
    'ngpu391n': {
      'ko': '예약완료!',
      'en': '',
    },
    'usv8gkh9': {
      'ko': '수업 재밌게 들으세요! :)',
      'en': '',
    },
    'qbo5qv38': {
      'ko': '홈으로 가기',
      'en': 'Go Home',
    },
    '46doyl8w': {
      'ko': 'Home',
      'en': '',
    },
  },
  // Chat
  {
    '43yanfxv': {
      'ko': '그룹 채팅',
      'en': 'Group Chat',
    },
  },
  // ChatGroups
  {
    '1szv7479': {
      'ko': '내 그룹',
      'en': 'My Groups',
    },
    'dxwm54gk': {
      'ko': '소셜',
      'en': 'Social',
    },
  },
  // ChatCreateGroup
  {
    '57oq4dyh': {
      'ko': '그룹 모임 생성',
      'en': 'Create Group Chat',
    },
    't0r1ol6b': {
      'ko': '모임상대 추가',
      'en': 'Select the friends to add to chat.',
    },
    'm6alrk5e': {
      'ko': '모임 생성',
      'en': 'Create Chat',
    },
    'ocbdrmzv': {
      'ko': '최소 2명을 추가해주세요! :)',
      'en': '',
    },
  },
  // ChatAddUser
  {
    'az1zj6hz': {
      'ko': '그룹에 추가',
      'en': '',
    },
    'suggcp5u': {
      'ko': '모임상대 추가',
      'en': 'Select the friends to add to chat.',
    },
    '95lqz7rq': {
      'ko': '그룹에 초대',
      'en': 'Invite to Chat',
    },
  },
  // BuyMembership
  {
    '8u4pgugs': {
      'ko': '멤버십 구매',
      'en': 'Buy Membership',
    },
    'jkw6s1i4': {
      'ko': 'Title',
      'en': '',
    },
    '3bt2tdow': {
      'ko': 'Subtext',
      'en': '',
    },
    'aljou63c': {
      'ko': '\$11.00',
      'en': '',
    },
    'evbkfjbl': {
      'ko': 'Title',
      'en': '',
    },
    '72e1oac2': {
      'ko': 'Subtext',
      'en': '',
    },
    '0ptk0xrn': {
      'ko': '\$11.00',
      'en': '',
    },
    'jigme8k5': {
      'ko': 'Title',
      'en': '',
    },
    '1p5hplt0': {
      'ko': 'Subtext',
      'en': '',
    },
    'fkntz9zj': {
      'ko': '\$11.00',
      'en': '',
    },
    'tn5ccd8w': {
      'ko': 'Title',
      'en': '',
    },
    '3a3iycky': {
      'ko': 'Subtext',
      'en': '',
    },
    'ohbapoiy': {
      'ko': '\$11.00',
      'en': '',
    },
    'nj3bwqe1': {
      'ko': 'Title',
      'en': '',
    },
    'm9x1app2': {
      'ko': 'Subtext',
      'en': '',
    },
    'crthfurf': {
      'ko': '\$11.00',
      'en': '',
    },
    'xsuj9279': {
      'ko': 'Title',
      'en': '',
    },
    '38ntkc9a': {
      'ko': 'Subtext',
      'en': '',
    },
    'mtknd7xr': {
      'ko': '\$11.00',
      'en': '',
    },
    'sopshgcf': {
      'ko': 'Title',
      'en': '',
    },
    'bfccv3ko': {
      'ko': 'Subtext',
      'en': '',
    },
    'khaykn19': {
      'ko': '\$11.00',
      'en': '',
    },
    '1t33dl87': {
      'ko': 'Home',
      'en': '',
    },
  },
  // ConfirmationCancel
  {
    'yf2s0tw9': {
      'ko': '예약을 취소하시겠습니까?',
      'en': 'Cancel reservation?',
    },
    'u55jruvs': {
      'ko': '취소하기',
      'en': 'Cancel Class',
    },
  },
  // ConfirmationReservation
  {
    'cixwrkmj': {
      'ko': '예약을 진행하시겠습니까?',
      'en': 'Reservation',
    },
    '7q84xuov': {
      'ko': '예약하기',
      'en': 'Reserve Class',
    },
  },
  // Reservation
  {
    '3xgaq3lj': {
      'ko': '수업 예약',
      'en': '',
    },
    '4ldfd1n9': {
      'ko': '날짜/시간 선택',
      'en': '',
    },
    'fitnbi1b': {
      'ko': '닫기',
      'en': '',
    },
  },
  // NoTimeSlotsAvailable
  {
    'k01vr0rj': {
      'ko': 'No Time Slots Available',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'e4o9fhp5': {
      'ko': '',
      'en': '',
    },
    'kocxjsvz': {
      'ko': '',
      'en': '',
    },
    'k5swvivw': {
      'ko': '',
      'en': '',
    },
    'wx8cmx4k': {
      'ko': '',
      'en': '',
    },
    'cfxvua7t': {
      'ko': '',
      'en': '',
    },
    'en96708l': {
      'ko': '',
      'en': '',
    },
    'ci5pvlio': {
      'ko': '',
      'en': '',
    },
    '1dqhkeav': {
      'ko': '',
      'en': '',
    },
    'ywylpb8u': {
      'ko': '',
      'en': '',
    },
    'pougmxb4': {
      'ko': '',
      'en': '',
    },
    'ul2ch2vc': {
      'ko': '',
      'en': '',
    },
    '2bykty23': {
      'ko': '',
      'en': '',
    },
    'yhjqqxcd': {
      'ko': '',
      'en': '',
    },
    'y2bhqz89': {
      'ko': '',
      'en': '',
    },
    'f5c3bk0b': {
      'ko': '',
      'en': '',
    },
    'u7daycyy': {
      'ko': '',
      'en': '',
    },
    'r9963xxh': {
      'ko': '',
      'en': '',
    },
    '3i4loii3': {
      'ko': '',
      'en': '',
    },
    'mp0ohp3w': {
      'ko': '',
      'en': '',
    },
    'h9m0xvuj': {
      'ko': '',
      'en': '',
    },
    'y8yh7c5q': {
      'ko': '',
      'en': '',
    },
    '7idfwztf': {
      'ko': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
