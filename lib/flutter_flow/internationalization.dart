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
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
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

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
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
      'en': '',
    },
    'lwr4upm4': {
      'ko': '',
      'en': '',
    },
    'sm6kkgm0': {
      'ko': '이메일',
      'en': '',
    },
    'uaptgtcu': {
      'ko': '',
      'en': '',
    },
    'nmslv0cc': {
      'ko': '비밀번호',
      'en': '',
    },
    'lbwr7onm': {
      'ko': '로그인',
      'en': '',
    },
    'qdypelx9': {
      'ko': '비밀번호 찾기',
      'en': '',
    },
    '17buouiy': {
      'ko': '둘러보기',
      'en': '',
    },
    '1lyvfoko': {
      'ko': '회원가입',
      'en': '',
    },
    'v2n03fwl': {
      'ko': '이름',
      'en': '',
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
      'en': '',
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
      'en': '',
    },
    'qwglaxrp': {
      'ko': 'Google로 로그인',
      'en': '',
    },
    'zwoheq92': {
      'ko': 'Apple로 로그인',
      'en': '',
    },
    '5ahve3qy': {
      'ko': 'E-mail로 로그인',
      'en': '',
    },
    '94yrjtwq': {
      'ko': '둘러보기',
      'en': '',
    },
    'q34ek0kh': {
      'ko': '회원가입',
      'en': '',
    },
    'sh0xuws4': {
      'ko': 'Google로 등록',
      'en': '',
    },
    'd33hhv9s': {
      'ko': 'Apple로 등록',
      'en': '',
    },
    '8s89w6h0': {
      'ko': 'E-mail로 등록',
      'en': '',
    },
    '45w6tqv2': {
      'ko': 'Home',
      'en': '',
    },
  },
  // ClassDetails
  {
    '551lzfm2': {
      'ko': '수업 정보 요약',
      'en': '',
    },
    'd36xhzaj': {
      'ko': '수업 예약',
      'en': '',
    },
    'i8vijwwa': {
      'ko': '로그인',
      'en': '',
    },
    'pthwba89': {
      'ko': '공지사항',
      'en': '',
    },
    '848lfv2w': {
      'ko': '운영시간',
      'en': '',
    },
    'o2b28yjl': {
      'ko': '리뷰',
      'en': '',
    },
  },
  // Classes
  {
    'ma6p27sk': {
      'ko': '그룹 운동시설',
      'en': '',
    },
    'tg7xd40n': {
      'ko': '전체 보기',
      'en': '',
    },
    '05csufli': {
      'ko': '필라테스',
      'en': '',
    },
    'wuqykbdw': {
      'ko': '크로스핏',
      'en': '',
    },
    'r8j1djeu': {
      'ko': '골프',
      'en': '',
    },
    'okglq00s': {
      'ko': '발레',
      'en': '',
    },
    'y5cftd3k': {
      'ko': 'PT',
      'en': '',
    },
    'furuppdj': {
      'ko': '주짓수',
      'en': '',
    },
    'r724rgb6': {
      'ko': '댄스',
      'en': '',
    },
    'wjgngsfj': {
      'ko': '요가',
      'en': '',
    },
    'cse5k69x': {
      'ko': '스피닝',
      'en': '',
    },
    '72kr8bab': {
      'ko': '목록 보기',
      'en': '',
    },
    'zcr8dm2g': {
      'ko': '내 주변',
      'en': '',
    },
  },
  // ReservationComplete
  {
    'ngpu391n': {
      'ko': '예약 요청 완료!',
      'en': '',
    },
    'qbo5qv38': {
      'ko': '다른 수업 보기',
      'en': '',
    },
    '46doyl8w': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MyPage
  {
    'wuo3ru0i': {
      'ko': '환경설정',
      'en': '',
    },
    '7vjallym': {
      'ko': '1:1 문의',
      'en': '',
    },
    '1dng9rwb': {
      'ko': '1:1 문의',
      'en': '',
    },
    'm3pfioi0': {
      'ko': '내가 추천한 친구 수',
      'en': '',
    },
    'lk2a9kq0': {
      'ko': '보유 크레딧',
      'en': '',
    },
    'p4sx1icp': {
      'ko': '내 포인트',
      'en': '',
    },
    '1t0zdkab': {
      'ko': '보유 크레딧',
      'en': '',
    },
    '309euai8': {
      'ko': '내 추천 코드',
      'en': '',
    },
    's3xwl9gf': {
      'ko': '보유 크레딧',
      'en': '',
    },
    '6cvf1cft': {
      'ko': '로그인',
      'en': '',
    },
    'auk1yhh3': {
      'ko': '추천 코드 복사',
      'en': '',
    },
    'zak15vob': {
      'ko': '내 정보',
      'en': '',
    },
    'szdy40va': {
      'ko': '내 정보',
      'en': '',
    },
  },
  // MyReservations
  {
    'mtl864zq': {
      'ko': ' - ',
      'en': '',
    },
    'nx5oww7a': {
      'ko': '예약현황',
      'en': '',
    },
    'rtdplk0h': {
      'ko': '예약현황',
      'en': '',
    },
  },
  // CustomerService
  {
    '1n2df4dp': {
      'ko': '문의사항을 남겨주세요',
      'en': '',
    },
    'hi52ztwl': {
      'ko': ' 대표번호: 010-5090-9006',
      'en': '',
    },
    'ukbbflf8': {
      'ko': '문의하기',
      'en': '',
    },
    'y2ezeldf': {
      'ko': '문의하기',
      'en': '',
    },
  },
  // Home
  {
    'ur5tuu56': {
      'ko': '공지사항',
      'en': '',
    },
    'mj97gh4q': {
      'ko': '인기 수업',
      'en': '',
    },
    'arb368t6': {
      'ko': '다른 수업 보기',
      'en': '',
    },
    'i4li92hl': {
      'ko': '로그인',
      'en': '',
    },
    'j5e1hdhm': {
      'ko': 'Go Fit',
      'en': '',
    },
    '09xuqskz': {
      'ko': '홈',
      'en': '',
    },
  },
  // AuthPhoneNumber
  {
    '1l46usfw': {
      'ko': '수업예약에 문제가 있을 경우 문자로 연락을 드립니다!',
      'en': '',
    },
    'jv9us8ey': {
      'ko': '',
      'en': '',
    },
    '177chycy': {
      'ko': '전화번호 입력해주세요',
      'en': '',
    },
    'pw7bppvd': {
      'ko': '추천인 코드 입력하고 보상 받으세요!',
      'en': '',
    },
    'i3vc2qrt': {
      'ko': '',
      'en': '',
    },
    'qbffn0wx': {
      'ko': '추천인 코드 입력해주세요',
      'en': '',
    },
    'yg6rsftp': {
      'ko': '추천코드 확인됐습니다!',
      'en': '',
    },
    'rxmzgx5x': {
      'ko': '유효하지 않은 추천코드입니다!',
      'en': '',
    },
    'g60u26y1': {
      'ko': '추천인 확인',
      'en': '',
    },
    '29e9mifs': {
      'ko': '완료',
      'en': '',
    },
    '9xumgdyd': {
      'ko': '정보 입력',
      'en': '',
    },
    'c0iemejo': {
      'ko': 'Home',
      'en': '',
    },
  },
  // Settings
  {
    'bc2j3zgc': {
      'ko': '로그아웃',
      'en': '',
    },
    'syouxty8': {
      'ko': '회원탈퇴',
      'en': '',
    },
    '4492bvg0': {
      'ko': '환경설정',
      'en': '',
    },
  },
  // Review
  {
    '3nhsokfa': {
      'ko': '수업은 어땠나요?',
      'en': '',
    },
    '9msuiz14': {
      'ko': '리뷰 작성하기',
      'en': '',
    },
    '9exzt1e7': {
      'ko': '리뷰',
      'en': '',
    },
  },
  // ConfirmationReservation
  {
    'cixwrkmj': {
      'ko': '예약을 진행하시겠습니까?',
      'en': '',
    },
    'voqvkzbp': {
      'ko': '예약 취소는 수업 시작 24시간 전 까지만 가능합니다.',
      'en': '',
    },
    '7q84xuov': {
      'ko': '예약하기',
      'en': '',
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
    '90u0b7za': {
      'ko': '수업이 없습니다',
      'en': '',
    },
  },
  // EmptyReservation
  {
    '6dr8u57v': {
      'ko': '예약한 수업이 없습니다',
      'en': '',
    },
  },
  // UpdateName
  {
    'ic2mbziq': {
      'ko': '이름 변경',
      'en': '',
    },
    'iu9vwco1': {
      'ko': '이름을 변경하기',
      'en': '',
    },
    'qki27un7': {
      'ko': '저장하기',
      'en': '',
    },
  },
  // UpdatePhone
  {
    'mim1fbpq': {
      'ko': '전화번호 변경',
      'en': '',
    },
    'kqrt5kyw': {
      'ko': '전화번호 변경하기',
      'en': '',
    },
    'n753wkou': {
      'ko': '저장하기',
      'en': '',
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
    'so7wju6g': {
      'ko':
          'We need to access your location in order to help you find the nearest fitness center.',
      'en': '',
    },
    'ritqug43': {
      'ko':
          'We need to access your notifications to allow you to receive notifications for the chat feature. The chat feature is used to group the people who workout on the same day and time.',
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
    'r6aa80jq': {
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
