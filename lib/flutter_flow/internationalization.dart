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
      'en': 'Go Fit',
    },
    'mrjn4nw8': {
      'ko': '로그인',
      'en': 'login',
    },
    'lwr4upm4': {
      'ko': '',
      'en': 'Email Address',
    },
    'sm6kkgm0': {
      'ko': '이메일',
      'en': 'email',
    },
    'uaptgtcu': {
      'ko': '',
      'en': '',
    },
    'nmslv0cc': {
      'ko': '비밀번호',
      'en': 'password',
    },
    'lbwr7onm': {
      'ko': '로그인',
      'en': 'login',
    },
    'qdypelx9': {
      'ko': '비밀번호 찾기',
      'en': 'Forgot your password',
    },
    'beorv1g4': {
      'ko': '먼저 둘러보기',
      'en': 'Take a tour first',
    },
    '1lyvfoko': {
      'ko': '회원가입',
      'en': 'Sign Up',
    },
    'v2n03fwl': {
      'ko': '이름',
      'en': 'name',
    },
    'pq9r0zt0': {
      'ko': '전화번호',
      'en': 'Phone number',
    },
    'h8ot3s4k': {
      'ko': '이메일',
      'en': 'email',
    },
    'u3t9zbc8': {
      'ko': '비밀번호',
      'en': 'password',
    },
    'untvo2lq': {
      'ko': '비밀번호 확인',
      'en': 'verify password',
    },
    'celr4qfk': {
      'ko': '회원가입',
      'en': 'Sign Up',
    },
    'kc9iznkl': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // AuthLogin
  {
    '196371zp': {
      'ko': 'Go Fit',
      'en': 'Go Fit',
    },
    '9t8b8ezy': {
      'ko': '로그인',
      'en': 'login',
    },
    'hcqp4p7i': {
      'ko': 'Sign in with Google',
      'en': 'Sign in with Google',
    },
    'qwglaxrp': {
      'ko': '구글',
      'en': 'Google',
    },
    'zwoheq92': {
      'ko': '애플',
      'en': 'Apple',
    },
    'f2xay9l9': {
      'ko': '이메일',
      'en': 'email',
    },
    '4scdlrn6': {
      'ko': '먼저 둘러보기',
      'en': 'Take a tour first',
    },
    'q34ek0kh': {
      'ko': '회원가입',
      'en': 'Sign Up',
    },
    'sh0xuws4': {
      'ko': '구글',
      'en': 'Google',
    },
    'd33hhv9s': {
      'ko': '애플',
      'en': 'Apple',
    },
    'd3532eyn': {
      'ko': '이메일',
      'en': 'email',
    },
    '45w6tqv2': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // MyReservations
  {
    'cvfu770k': {
      'ko': '최신',
      'en': 'recent',
    },
    'gwavr9ay': {
      'ko': '예약현황',
      'en': 'Reservation status',
    },
    'rtdplk0h': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // ClassDetails
  {
    'kj9uvxm7': {
      'ko': '수업 유형',
      'en': 'class type',
    },
    'njp96srb': {
      'ko': '소요 시간',
      'en': 'time taken',
    },
    'p9p3nl8a': {
      'ko': '수업 준비물',
      'en': 'class supplies',
    },
    'ra6ymp6e': {
      'ko': '기타',
      'en': 'Other',
    },
    'zj33isu8': {
      'ko': '네이버 맵',
      'en': 'NAVER MAPS',
    },
    'bjlzd4ig': {
      'ko': '인스타',
      'en': 'INSTAGRAM',
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
      'en': 'exercise facility',
    },
    '4v43t5yc': {
      'ko': '운동시설',
      'en': 'exercise facility',
    },
  },
  // Settings
  {
    'amv6f82u': {
      'ko': '내 계정',
      'en': 'my account',
    },
    '3y491idk': {
      'ko': '예약현황',
      'en': 'Reservation status',
    },
    'zt2qicvo': {
      'ko': '멤버십 구매',
      'en': 'Buy Membership',
    },
    'wuo3ru0i': {
      'ko': '계정삭제',
      'en': 'Terms of service',
    },
    'ozvae4ko': {
      'ko': '피드백 남기기',
      'en': 'Terms of service',
    },
    'n6ejduc0': {
      'ko': '보유 크레딧',
      'en': 'holding credit',
    },
    'ks1i92zv': {
      'ko': '전화번호 입력',
      'en': 'Enter phone number',
    },
    'iyzbxe2u': {
      'ko': '번호 저장',
      'en': 'save number',
    },
    'ui4w6k2x': {
      'ko': '예약이 불가능할 때 급하게 연락드리기 위해 전환번호가 필요합니다!',
      'en':
          'We need a conversion number to contact you urgently when reservations are not possible!',
    },
    'mqz45pq4': {
      'ko': '[User Name]',
      'en': '[User Name]',
    },
    'zilqow9t': {
      'ko': '[username@domain.com]',
      'en': '[username@domain.com]',
    },
    'szdy40va': {
      'ko': '내정보',
      'en': 'My Info',
    },
  },
  // ChatGroups
  {
    'dkh9qzkk': {
      'ko': '내 그룹',
      'en': 'my group',
    },
    'yjs0nx2h': {
      'ko': '운동 모집 채팅',
      'en': 'athletic recruitment chat',
    },
    'ycwcocb2': {
      'ko': '내 채팅',
      'en': 'my chat',
    },
    'ii39eso6': {
      'ko': '소셜',
      'en': 'social',
    },
  },
  // Chat
  {
    '43yanfxv': {
      'ko': '그룹 채팅',
      'en': 'group chat',
    },
  },
  // ChatCreateGroup
  {
    '57oq4dyh': {
      'ko': '그룹 모임 생성',
      'en': 'Create a group meeting',
    },
    't0r1ol6b': {
      'ko': '모임상대 추가',
      'en': 'Add meeting partner',
    },
    'm6alrk5e': {
      'ko': '모임 생성',
      'en': 'create meeting',
    },
    'ocbdrmzv': {
      'ko': '최소 2명을 추가해주세요! :)',
      'en': 'Please add at least 2 people! :)',
    },
  },
  // ReservationComplete
  {
    'ngpu391n': {
      'ko': '예약완료!',
      'en': 'reservation complete!',
    },
    'usv8gkh9': {
      'ko': '수업 재밌게 들으세요! :)',
      'en': 'Enjoy the class! :)',
    },
    'qbo5qv38': {
      'ko': '홈으로 가기',
      'en': 'go home',
    },
    '46doyl8w': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // ChatAddUser
  {
    'az1zj6hz': {
      'ko': '그룹에 추가',
      'en': 'add to group',
    },
    'suggcp5u': {
      'ko': '모임상대 추가',
      'en': 'Add meeting partner',
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
      'en': 'Title',
    },
    '3bt2tdow': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'aljou63c': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'evbkfjbl': {
      'ko': 'Title',
      'en': 'Title',
    },
    '72e1oac2': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    '0ptk0xrn': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'jigme8k5': {
      'ko': 'Title',
      'en': 'Title',
    },
    '1p5hplt0': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'fkntz9zj': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'tn5ccd8w': {
      'ko': 'Title',
      'en': 'Title',
    },
    '3a3iycky': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'ohbapoiy': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'nj3bwqe1': {
      'ko': 'Title',
      'en': 'Title',
    },
    'm9x1app2': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'crthfurf': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'xsuj9279': {
      'ko': 'Title',
      'en': 'Title',
    },
    '38ntkc9a': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'mtknd7xr': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    'sopshgcf': {
      'ko': 'Title',
      'en': 'Title',
    },
    'bfccv3ko': {
      'ko': 'Subtext',
      'en': 'Subtext',
    },
    'khaykn19': {
      'ko': '\$11.00',
      'en': '\$11.00',
    },
    '1t33dl87': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // Feedback
  {
    'ijr7xhfd': {
      'ko': '피드백 남기기',
      'en': '',
    },
    'ppw7mhc5': {
      'ko': '피드백 남겨주세요!\n1. 추가적으로 하고 싶은 운동\n2. 사용하면서 좋았던 점과 불편했던 점',
      'en': '',
    },
    '3a42vjju': {
      'ko': '피드백 남기기',
      'en': '',
    },
  },
  // ConfirmationCancel
  {
    'yf2s0tw9': {
      'ko': '예약을 취소하시겠습니까?',
      'en': 'Are you sure you want to cancel your reservation?',
    },
    'u55jruvs': {
      'ko': '취소하기',
      'en': 'cancel',
    },
  },
  // ConfirmationReservation
  {
    'cixwrkmj': {
      'ko': '예약을 진행하시겠습니까?',
      'en': 'Would you like to proceed with the reservation?',
    },
    '7q84xuov': {
      'ko': '예약하기',
      'en': 'Make a reservation',
    },
  },
  // Reservation
  {
    '3xgaq3lj': {
      'ko': '수업 예약',
      'en': 'Book a class',
    },
    '4ldfd1n9': {
      'ko': '날짜/시간 선택',
      'en': 'Select Date/Time',
    },
    'fitnbi1b': {
      'ko': '닫기',
      'en': 'to close',
    },
  },
  // NoTimeSlotsAvailable
  {
    '90u0b7za': {
      'ko': '수업이 없습니다',
      'en': 'no classes',
    },
  },
  // EmptyChat
  {
    '8gazeklv': {
      'ko': '채팅그룹이 없습니다',
      'en': 'There are no chat groups',
    },
  },
  // EmptyReservation
  {
    '6dr8u57v': {
      'ko': '예약한 수업이 없습니다',
      'en': 'No classes booked',
    },
  },
  // ChatUserList
  {
    'ajeaeil6': {
      'ko': '그룹 멤버',
      'en': 'group member',
    },
    'cfupxao9': {
      'ko': '같이 운동하는 멤버들입니다! :)',
      'en': 'These are the members who exercise together! :)',
    },
    '58sz0ojd': {
      'ko': '닫기',
      'en': 'to close',
    },
  },
  // InsertPhoneNumber
  {
    '8ftjlwvi': {
      'ko': '전환번호 입력',
      'en': 'Enter conversion number',
    },
    'o6ki3du3': {
      'ko': '예약이 불가능할 때 급하게 연락드리기 전환번호가 필요합니다!',
      'en':
          'I need a conversion number to contact you urgently when a reservation is not possible!',
    },
    '4l6vq5fy': {
      'ko': '전화번호 입력해주세요',
      'en': 'Please enter your phone number',
    },
    'jfog9f6q': {
      'ko': '저장하기',
      'en': 'save',
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
