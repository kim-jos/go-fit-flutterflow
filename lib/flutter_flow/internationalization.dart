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
      'en': 'Login',
    },
    'lwr4upm4': {
      'ko': '',
      'en': 'Email',
    },
    'sm6kkgm0': {
      'ko': '이메일',
      'en': 'Email',
    },
    'uaptgtcu': {
      'ko': '',
      'en': '',
    },
    'nmslv0cc': {
      'ko': '비밀번호',
      'en': 'Password',
    },
    'lbwr7onm': {
      'ko': '로그인',
      'en': 'Login',
    },
    'qdypelx9': {
      'ko': '비밀번호 찾기',
      'en': 'Forgot your password?',
    },
    'beorv1g4': {
      'ko': '먼저 둘러보기',
      'en': 'Take a look around',
    },
    '1lyvfoko': {
      'ko': '회원가입',
      'en': 'Register',
    },
    'v2n03fwl': {
      'ko': '이름',
      'en': 'Name',
    },
    'pq9r0zt0': {
      'ko': '전화번호',
      'en': 'Phone number',
    },
    'h8ot3s4k': {
      'ko': '이메일',
      'en': 'Email',
    },
    'u3t9zbc8': {
      'ko': '비밀번호',
      'en': 'Password',
    },
    'untvo2lq': {
      'ko': '비밀번호 확인',
      'en': 'Verify password',
    },
    'celr4qfk': {
      'ko': '회원가입',
      'en': 'Register',
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
      'en': 'Login',
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
      'en': 'Email',
    },
    '4scdlrn6': {
      'ko': '먼저 둘러보기',
      'en': 'Take a look around',
    },
    'q34ek0kh': {
      'ko': '회원가입',
      'en': 'Register',
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
      'en': 'Email',
    },
    '45w6tqv2': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // ClassDetails
  {
    'kj9uvxm7': {
      'ko': '수업 유형',
      'en': 'Class type',
    },
    'njp96srb': {
      'ko': '소요 시간',
      'en': 'Duration',
    },
    'p9p3nl8a': {
      'ko': '수업 준비물',
      'en': 'Class Requirements',
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
      'en': 'Fitness Centers',
    },
    '4v43t5yc': {
      'ko': '운동시설',
      'en': 'Fitness Centers',
    },
  },
  // MyReservations
  {
    'cvfu770k': {
      'ko': '최신',
      'en': 'Recent',
    },
    'zomtvc99': {
      'ko': ' - ',
      'en': '',
    },
    'gwavr9ay': {
      'ko': '예약현황',
      'en': 'My Reservations',
    },
    'rtdplk0h': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // ChatGroups
  {
    'dkh9qzkk': {
      'ko': '내 그룹',
      'en': 'My groups',
    },
    'yjs0nx2h': {
      'ko': '운동 모집 채팅',
      'en': 'Find Workout Groups',
    },
    'ycwcocb2': {
      'ko': '내 채팅',
      'en': 'My Chat',
    },
    'ii39eso6': {
      'ko': '소셜',
      'en': 'Social',
    },
  },
  // Settings
  {
    'amv6f82u': {
      'ko': '내 계정',
      'en': 'My Account',
    },
    '3y491idk': {
      'ko': '예약현황',
      'en': 'My Reservations',
    },
    'zt2qicvo': {
      'ko': '멤버십 가입',
      'en': 'Buy Membership',
    },
    'wuo3ru0i': {
      'ko': '계정삭제',
      'en': 'Terms of Service',
    },
    'ozvae4ko': {
      'ko': '피드백 남기기',
      'en': 'Give Feedback',
    },
    'n6ejduc0': {
      'ko': '보유 크레딧',
      'en': 'Remaining Credits',
    },
    'ks1i92zv': {
      'ko': '전화번호 입력',
      'en': 'Enter phone number',
    },
    'iyzbxe2u': {
      'ko': '번호 저장',
      'en': 'Save number',
    },
    'ui4w6k2x': {
      'ko': '예약이 불가능할 때 급하게 연락드리기 위해 전환번호가 필요합니다!',
      'en':
          'We need your number to contact you in case of emergencies regarding your reservations.',
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
      'ko': '내 계정',
      'en': 'My Account',
    },
  },
  // Chat
  {
    '43yanfxv': {
      'ko': '그룹 채팅',
      'en': 'Group Chat',
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
      'en': 'Invite Friend',
    },
    'm6alrk5e': {
      'ko': '모임 생성',
      'en': 'Create Group Chat',
    },
    'ocbdrmzv': {
      'ko': '최소 2명을 추가해주세요! :)',
      'en': 'Add at least 2 people! :)',
    },
  },
  // ReservationComplete
  {
    'ngpu391n': {
      'ko': '예약 요청 완료!',
      'en': 'Reservation Request Complete!',
    },
    'qbo5qv38': {
      'ko': '다른 수업 보기',
      'en': 'Home',
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
      'en': 'Add to Group',
    },
    'suggcp5u': {
      'ko': '모임상대 추가',
      'en': 'Invite Friend',
    },
  },
  // Feedback
  {
    'ijr7xhfd': {
      'ko': '피드백 남기기',
      'en': 'Provide Feedback',
    },
    'ppw7mhc5': {
      'ko': '피드백 남겨주세요!\n1. 추가적으로 하고 싶은 운동\n2. 사용하면서 좋았던 점과 불편했던 점',
      'en':
          'Any feedback regarding your experience using the app is highly appreciated!',
    },
    '3a42vjju': {
      'ko': '피드백 남기기',
      'en': 'Provide Feedback',
    },
  },
  // TermsOfService
  {
    'ou1rvpv7': {
      'ko': '예약 가능 시간',
      'en': '',
    },
    'iuz9aqqb': {
      'ko': '예약은 수업 시작 6시간 전까지 가능합니다.',
      'en': '',
    },
    'gspjll2r': {
      'ko': '취소 가능 시간',
      'en': '',
    },
    'b1htz7hp': {
      'ko': '예약 취소는 수업 시작 24시간 전까지 가능합니다.',
      'en': '',
    },
    'bu5z0jkm': {
      'ko': '이용약관',
      'en': 'Terms of Service',
    },
  },
  // Subscriptions
  {
    'noirvxk1': {
      'ko': 'Your Subscription',
      'en': '',
    },
    'i6hfpu2o': {
      'ko': 'Monthly',
      'en': '',
    },
    'uuxo797z': {
      'ko': '\$15.99/mo',
      'en': '',
    },
    'sdey7x8s': {
      'ko': 'Gain unlimited access to all the content we have to offer! ',
      'en': '',
    },
    'bitubv9f': {
      'ko': 'Other Offers',
      'en': '',
    },
    'a3qzhdv2': {
      'ko': 'Annual (save \$12)',
      'en': '',
    },
    'erridth4': {
      'ko': '\$180/yr',
      'en': '',
    },
    'kgjfklfc': {
      'ko': 'Gain unlimited access to all the content we have to offer! ',
      'en': '',
    },
    'cnrcyquv': {
      'ko': 'Change Plan',
      'en': '',
    },
    'gr40xyck': {
      'ko': 'Subscription / Payment',
      'en': '',
    },
    'hn0ie7tf': {
      'ko': 'Home',
      'en': '',
    },
  },
  // ConfirmationReservation
  {
    'cixwrkmj': {
      'ko': '예약을 진행하시겠습니까?',
      'en': 'Proceed with reservation?',
    },
    'voqvkzbp': {
      'ko': '예약 취소는 수업 시작 24시간 전 까지만 가능합니다.',
      'en': 'Proceed with reservation?',
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
      'en': 'Make reservation',
    },
    '4ldfd1n9': {
      'ko': '날짜/시간 선택',
      'en': 'Select Date/Time',
    },
    'fitnbi1b': {
      'ko': '닫기',
      'en': 'Close',
    },
  },
  // NoTimeSlotsAvailable
  {
    '90u0b7za': {
      'ko': '수업이 없습니다',
      'en': 'No classes',
    },
  },
  // EmptyChat
  {
    '8gazeklv': {
      'ko': '채팅그룹이 없습니다',
      'en': 'No chat groups',
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
      'en': 'Group Members',
    },
    'cfupxao9': {
      'ko': '같이 운동하는 멤버들입니다! :)',
      'en': 'Your Workout Buddies ! :)',
    },
    '58sz0ojd': {
      'ko': '닫기',
      'en': 'Close',
    },
  },
  // InsertPhoneNumber
  {
    '8ftjlwvi': {
      'ko': '전화번호 입력',
      'en': 'Enter phone number',
    },
    'o6ki3du3': {
      'ko': '예약이 불가능할 때 급하게 연락드리기 전환번호가 필요합니다!',
      'en':
          'We need your number to contact you in case of emergencies regarding your reservations.',
    },
    '4l6vq5fy': {
      'ko': '전화번호 입력해주세요',
      'en': 'Please enter your phone number',
    },
    'jfog9f6q': {
      'ko': '저장하기',
      'en': 'Save',
    },
  },
  // Miscellaneous
  {
    'e4o9fhp5': {
      'ko':
          'We need to access your camera to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
      'en': '',
    },
    'kocxjsvz': {
      'ko':
          'We need to access your photo library to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
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
