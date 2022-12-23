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
      'en': 'log in',
    },
    'lwr4upm4': {
      'ko': '',
      'en': 'Email',
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
      'en': 'log in',
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
      'en': 'log in',
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
      'en': 'Naver Map',
    },
    'bjlzd4ig': {
      'ko': '인스타',
      'en': 'insta',
    },
  },
  // MyReservations
  {
    'cvfu770k': {
      'ko': '최신',
      'en': 'recent',
    },
    'zomtvc99': {
      'ko': ' - ',
      'en': '-',
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
      'ko': '멤버십 가입',
      'en': 'sign up for membership',
    },
    'wuo3ru0i': {
      'ko': '계정삭제',
      'en': 'Delete account',
    },
    'ozvae4ko': {
      'ko': '피드백 남기기',
      'en': 'leave feedback',
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
          'We need a conversion number to contact you urgently when a reservation is not possible!',
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
      'en': 'my account',
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
      'ko': '예약 요청 완료!',
      'en': 'Reservation request complete!',
    },
    'qbo5qv38': {
      'ko': '다른 수업 보기',
      'en': 'View other classes',
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
  // Feedback
  {
    'ijr7xhfd': {
      'ko': '피드백 남기기',
      'en': 'leave feedback',
    },
    'ppw7mhc5': {
      'ko': '피드백 남겨주세요!\n1. 추가적으로 하고 싶은 운동\n2. 사용하면서 좋았던 점과 불편했던 점',
      'en':
          'Please leave your feedback!\n1. What exercise do you want to do additionally?\n2. What was good and what was inconvenient while using it',
    },
    '3a42vjju': {
      'ko': '피드백 남기기',
      'en': 'leave feedback',
    },
  },
  // TermsOfService
  {
    'ou1rvpv7': {
      'ko': '예약 가능 시간',
      'en': 'Reservation time',
    },
    'iuz9aqqb': {
      'ko': '예약은 수업 시작 6시간 전까지 가능합니다.',
      'en': 'Reservations can be made up to 6 hours before class starts.',
    },
    'gspjll2r': {
      'ko': '취소 가능 시간',
      'en': 'time to cancel',
    },
    'b1htz7hp': {
      'ko': '예약 취소는 수업 시작 24시간 전까지 가능합니다.',
      'en':
          'Reservations can be canceled up to 24 hours prior to class start time.',
    },
    'bu5z0jkm': {
      'ko': '이용약관',
      'en': 'Terms of service',
    },
  },
  // Subscriptions
  {
    '8h9s06ky': {
      'ko': '멤버십',
      'en': 'membership',
    },
    'tr1edtno': {
      'ko': 'Standard 멤버십',
      'en': 'Standard membership',
    },
    '0nvq0r7u': {
      'ko': '79,000만원',
      'en': '79,000 won',
    },
    'tkatyv4n': {
      'ko': '프리미엄 수업 4회권',
      'en': '4 premium classes',
    },
    'coro3xo4': {
      'ko': 'Lite 멤버십',
      'en': 'Lite membership',
    },
    'po5qheit': {
      'ko': '42,000만원',
      'en': 'KRW 42,000,000',
    },
    '7bnuy9xx': {
      'ko': '프리미엄 수업 2회권',
      'en': '2 premium class tickets',
    },
    'ib4ij1qi': {
      'ko': '멤버십 가입',
      'en': 'sign up for membership',
    },
    'oo6r1ns9': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // SubscriptionsCopy
  {
    'tay7zjdj': {
      'ko': '멤버십',
      'en': 'membership',
    },
    'tag46a4v': {
      'ko': '프리미엄 수업 4회권',
      'en': '4 premium classes',
    },
    '93mqyxly': {
      'ko': 'Lite 멤버십',
      'en': 'Lite membership',
    },
    '3887327r': {
      'ko': '42,000만원',
      'en': 'KRW 42,000,000',
    },
    '4igfn9j4': {
      'ko': '프리미엄 수업 2회권',
      'en': '2 premium class tickets',
    },
    'qsfv3e46': {
      'ko': '멤버십 가입',
      'en': 'sign up for membership',
    },
    'uildbl37': {
      'ko': 'Home',
      'en': 'Home',
    },
  },
  // ConfirmationReservation
  {
    'cixwrkmj': {
      'ko': '예약을 진행하시겠습니까?',
      'en': 'Would you like to proceed with the reservation?',
    },
    'voqvkzbp': {
      'ko': '예약 취소는 수업 시작 24시간 전 까지만 가능합니다.',
      'en':
          'Reservation cancellation is only possible up to 24 hours before the class starts.',
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
      'ko': '전화번호 입력',
      'en': 'Enter phone number',
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
      'ko':
          'We need to access your camera to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
      'en':
          'We need to access your camera to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
    },
    'kocxjsvz': {
      'ko':
          'We need to access your photo library to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
      'en':
          'We need to access your photo library to allow you to upload a profile picture. The picture will only be used for your personal profile page. People will be able to view your profile page when you make a reservation for a class.',
    },
    'ritqug43': {
      'ko':
          'We need to access your notifications to allow you to receive notifications for the chat feature. The chat feature is used to group the people who workout on the same day and time.',
      'en':
          'We need to access your notifications to allow you to receive notifications for the chat feature. The chat feature is used to group the people who workout on the same day and time.',
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
