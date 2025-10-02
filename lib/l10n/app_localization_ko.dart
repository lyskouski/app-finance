// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => '정보';

  @override
  String get account => '계정';

  @override
  String get accountFrom => '계정에서';

  @override
  String get accountHeadline => '계정';

  @override
  String get accountTo => '계정으로 이동';

  @override
  String get accountTooltip => '계좌 개설';

  @override
  String get accountType => '계좌 유형';

  @override
  String get accountTypeTooltip => '계좌 유형 선택';

  @override
  String get acknowledgeTooltip => '승인';

  @override
  String get activate => '활성화';

  @override
  String get actualData => '과거 데이터';

  @override
  String get addAccountTooltip => '계정 추가';

  @override
  String get addBudgetTooltip => '새 예산 카테고리 추가';

  @override
  String get addGoalTooltip => '새 목표 추가';

  @override
  String get addMainTooltip => '청구서, 수입 또는 이체 추가';

  @override
  String afterNDays(Object value) {
    return '$value일 후';
  }

  @override
  String appBuild(Object build) {
    return '빌드: $build';
  }

  @override
  String get appInitHeadline => '프로젝트 초기화';

  @override
  String get appStartHeadline => '초기 설정';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return '버전 $version';
  }

  @override
  String get automationHeadline => '자동화';

  @override
  String get automationTypeDays => '며칠 후';

  @override
  String get backTooltip => '뒤로 돌아가기';

  @override
  String get balance => '실제 잔액';

  @override
  String get balanceDate => '잔액 날짜 업데이트';

  @override
  String get balanceDateTooltip => '이 날짜 이전의 결과 및 수입은 잔액에 영향을 미치지 않습니다.';

  @override
  String get balanceTooltip => '잔액 설정';

  @override
  String get bankAccount => '은행 계좌';

  @override
  String get bill => '청구서';

  @override
  String get billHeadline => '청구서';

  @override
  String get billSetTooltip => '금액 설정';

  @override
  String billSum(Object value) {
    return '청구서: $value';
  }

  @override
  String get billTooltip => '청구서 열기';

  @override
  String get billTypeTooltip => '[유형] 청구서, 수입 또는 이체';

  @override
  String get brightnessTheme => '밝기 테마';

  @override
  String get btnAdd => '추가';

  @override
  String get btnCancel => '취소';

  @override
  String get btnConfirm => '확인';

  @override
  String get btnMore => '더 보기';

  @override
  String get budget => '예산 카테고리';

  @override
  String get budgetHeadline => '예산';

  @override
  String get budgetLimit => '월별 한도';

  @override
  String get budgetLimitHeadline => '한도 조정';

  @override
  String get budgetRelativeLimit => '월별 상대 계수';

  @override
  String get budgetTooltip => '열린 예산 유형';

  @override
  String get budgetType => '예산 책정 간격';

  @override
  String get budgetTypeAsIs => '무제한';

  @override
  String get budgetTypeFixed => '고정';

  @override
  String get budgetTypeMonth => '매월';

  @override
  String get budgetTypeRelative => '상대';

  @override
  String get budgetTypeWeek => '매주';

  @override
  String get budgetTypeYear => '연간';

  @override
  String get cash => '현금';

  @override
  String get chartBarRace => '카테고리별 바 경쟁';

  @override
  String get chartForecast => '예측 차트';

  @override
  String get chartOHLC => '캔들스틱(OHLC) 차트';

  @override
  String get chartYtdExpense => '연도별 비용';

  @override
  String get clear => '드롭 가치';

  @override
  String get closeTooltip => '닫기';

  @override
  String get closedAt => '완료된 날짜까지';

  @override
  String get cmpChart => '다이어그램';

  @override
  String get cmpRecent => '최근 항목';

  @override
  String get cmpRecentCount => '목록 크기';

  @override
  String get coAuthor => '저자';

  @override
  String get coConsult => '어드바이저';

  @override
  String get coDeveloper => '개발자';

  @override
  String get coNew => '참여';

  @override
  String get coPromoter => '프로모터';

  @override
  String get coTranslator => '번역가';

  @override
  String get coef => '계수';

  @override
  String get collapse => '접기(복원) 섹션';

  @override
  String get color => '색상';

  @override
  String get colorApp => '사용자 지정';

  @override
  String get colorBackground => '배경';

  @override
  String get colorDark => '다크';

  @override
  String get colorInversePrimary => '역 기본';

  @override
  String get colorInverseSurface => '역 표면';

  @override
  String get colorLight => '빛';

  @override
  String get colorOnInverseSurface => '역 표면 켜기';

  @override
  String get colorOnSecondary => '보조에';

  @override
  String get colorOnSecondaryContainer => '컨테이너에';

  @override
  String get colorPrimary => '기본';

  @override
  String get colorRestore => '팔레트 재설정';

  @override
  String get colorSecondary => '보조';

  @override
  String get colorSystem => '기본값';

  @override
  String get colorTheme => '팔레트';

  @override
  String get colorTooltip => '색상 선택';

  @override
  String get colorType => '색상 유형';

  @override
  String get colorUser => '개인';

  @override
  String columnMap(Object value) {
    return '\'$value\' 열에 대한 매핑';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - 열 매핑 선택';
  }

  @override
  String get completeGoalTooltip => '목표 완료';

  @override
  String get confirmHeader => '작업 확인';

  @override
  String get confirmTooltip => '확실하신가요? 이 작업은 실행 취소할 수 없습니다.';

  @override
  String get contributors => '기여자';

  @override
  String get conversion => '전환';

  @override
  String conversionMessage(Object currency) {
    return '$currency 로 전환';
  }

  @override
  String get createAccountHeader => '새 계정 만들기';

  @override
  String get createAccountTooltip => '새 계정 만들기';

  @override
  String get createBillHeader => '새 트랜잭션 만들기';

  @override
  String get createBillTooltip => '새 청구서 추가';

  @override
  String get createBudgetHeader => '새 예산 카테고리';

  @override
  String get createBudgetTooltip => '새 예산 카테고리 만들기';

  @override
  String get createGoalHeader => '목표 만들기';

  @override
  String get createGoalTooltip => '새 목표 추가';

  @override
  String get createIncomeTooltip => '새 수입 추가';

  @override
  String get createPaymentTooltip => '새 결제 추가';

  @override
  String get createTransferTooltip => '이체 생성';

  @override
  String get credit => '크레딧';

  @override
  String get creditCard => '신용 카드';

  @override
  String get currency => '통화';

  @override
  String get currencyAddHeadline => '통화 교환';

  @override
  String get currencyAddTooltip => '환율 추가';

  @override
  String get currencyDefault => '기본 통화';

  @override
  String get currencyDistribution => '배포';

  @override
  String currencyExchange(Object from, Object to) {
    return '통화 교환: $from -> $to';
  }

  @override
  String get currencyHeadline => '통화';

  @override
  String currencyIn(Object value) {
    return '에서 $value';
  }

  @override
  String get currencyShort => '통화';

  @override
  String get currencyTooltip => '통화 유형(코드)';

  @override
  String get currencyUpdateTooltip => '환율 업데이트';

  @override
  String get currentDate => '현재 날짜 포인터';

  @override
  String get customAddTooltip => '위젯 추가';

  @override
  String get customDeleteTooltip => '사용자 지정 삭제';

  @override
  String get customSaveTooltip => '사용자 지정 저장';

  @override
  String get customizeTooltip => '페이지 사용자 지정';

  @override
  String get darkMode => '어둡게';

  @override
  String get dateFormat => '날짜 형식';

  @override
  String get dateRange => '날짜 범위';

  @override
  String get dateTooltip => '날짜 선택';

  @override
  String get dayMonday => '월요일';

  @override
  String get dayStartOfMonth => '이달의 시작';

  @override
  String get dayStartOfWeek => '주 시작';

  @override
  String get daySunday => '일요일';

  @override
  String get debitCard => '직불 카드';

  @override
  String def(Object value) {
    return '\'$value\'의 기본값';
  }

  @override
  String get deleteAccountTooltip => '계정 비활성화';

  @override
  String get deleteBillTooltip => '청구서 삭제';

  @override
  String get deleteBudgetTooltip => '예산 카테고리 비활성화';

  @override
  String get deleteGoalTooltip => '목표 삭제';

  @override
  String get deleteInvoiceTooltip => '인보이스 삭제';

  @override
  String get deletePaymentTooltip => '결제 삭제';

  @override
  String get deleteTooltip => '삭제';

  @override
  String get deleteTransferTooltip => '송금 삭제';

  @override
  String get deposit => '입금';

  @override
  String get description => '설명';

  @override
  String get descriptionTooltip => '비용 세부 정보 설정';

  @override
  String get design => '디자인 모드(문화권별)';

  @override
  String get designAsiaGeneral => '아시아 일반';

  @override
  String get designGermany => '독일';

  @override
  String get designGlobal => '글로벌';

  @override
  String get designRtlGeneral => '오른쪽에서 왼쪽 레터링';

  @override
  String get details => '세부 정보';

  @override
  String get detailsTooltip => '****2345 - 숫자 마지막 4자리';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => '오전/오후 시간(0~11)';

  @override
  String get dtDay => '월의 일';

  @override
  String get dtEscape => '텍스트 이스케이프';

  @override
  String get dtHalfHour => '오전/오후 시간(1~12)';

  @override
  String get dtHour => '시간(일 단위)(0~23)';

  @override
  String get dtMinute => '분(시간)';

  @override
  String get dtMonth => '연도 내 월';

  @override
  String get dtNamedDay => '요일';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => '작은따옴표';

  @override
  String get dtSecond => '초 단위';

  @override
  String get dtYear => '년';

  @override
  String get editAccountHeader => '계정 업데이트';

  @override
  String get editAccountTooltip => '계정 수정';

  @override
  String get editBillHeader => '청구서 업데이트';

  @override
  String get editBillTooltip => '청구서 편집';

  @override
  String get editBudgetHeader => '예산 카테고리 업데이트';

  @override
  String get editBudgetTooltip => '예산 카테고리 편집';

  @override
  String get editGoalHeader => '목표 업데이트';

  @override
  String get editGoalTooltip => '목표 편집';

  @override
  String get editInvoiceTooltip => '인보이스 편집';

  @override
  String get editPaymentTooltip => '결제 수정';

  @override
  String get editTooltip => '편집';

  @override
  String get editTransferTooltip => '전송 편집';

  @override
  String get encryptionMode => '데이터 암호화';

  @override
  String error(Object value) {
    return '오류입니다: $value';
  }

  @override
  String get errorExpired => '카드가 만료되었습니다.';

  @override
  String get errorNegative => '음수일 수 없습니다! 오류를 수정하세요.';

  @override
  String get example => '예제';

  @override
  String get expand => '섹션 확장';

  @override
  String get expense => '비용 금액';

  @override
  String get expenseDateTime => '청구지';

  @override
  String get expenseHeadline => '비용';

  @override
  String get expenseTransfer => '이체 금액';

  @override
  String exportFile(Object value) {
    return '.$value 파일로 내보내기';
  }

  @override
  String get failData => '금액 공제';

  @override
  String get flowTypeInvoice => '인보이스';

  @override
  String get flowTypeTooltip => '금액 유형: 청구서, 송장';

  @override
  String get forecastData => '예상';

  @override
  String get from => '에서';

  @override
  String get goNextTooltip => '다음 단계로 이동';

  @override
  String get goalHeadline => '목표';

  @override
  String goalProfit(Object value) {
    return '목표: $value';
  }

  @override
  String get goalProfitTooltip => '이익 대 목표 목표';

  @override
  String get goalTooltip => '목표 열기';

  @override
  String get hasEncrypted => '한 번 설정하면 변경할 수 없습니다.';

  @override
  String get helpTooltip => '[도움말] 해당 페이지에 대한 설명 표시';

  @override
  String get homeHeadline => '홈';

  @override
  String get homeTooltip => '메인 페이지로 돌아가기';

  @override
  String get icon => '아이콘';

  @override
  String get iconTooltip => '아이콘 선택';

  @override
  String get ignoreTooltip => '무시';

  @override
  String get importHeadline => '가져오기/내보내기';

  @override
  String get income => '수입 금액';

  @override
  String get incomeHeadline => '수입';

  @override
  String get incomeHealth => '소득 건강 레이더';

  @override
  String get incomeTooltip => '수입 세부 정보 설정';

  @override
  String get invoiceHeadline => '인보이스';

  @override
  String invoiceSum(Object value) {
    return '송장 $value';
  }

  @override
  String get isCleaned => '기존 데이터 제거';

  @override
  String get isCreated => '이미 생성되었으면 다음 단계를 따르세요!';

  @override
  String get isEncrypted => '파일이 암호화됨(기본값)';

  @override
  String get isRequired => '필수';

  @override
  String get language => '언어';

  @override
  String get left => '왼쪽';

  @override
  String get lightMode => '빛';

  @override
  String get link => '유니폼 리소스 로케이터(URL)';

  @override
  String get meaning => '의미';

  @override
  String get metricsHeadline => '메트릭';

  @override
  String get metricsTooltip => '메트릭';

  @override
  String get milestones => '마일스톤';

  @override
  String get missingContent => '파일을 처리할 수 없음(취소됨)';

  @override
  String get navigationTooltip => '메인 메뉴 열기';

  @override
  String netProfit(Object value) {
    return '수익: $value';
  }

  @override
  String get noChartData => '표시할 데이터가 누락되었거나 충분하지 않습니다.';

  @override
  String get notifyHeadline => '알림 파서';

  @override
  String get ok => '확인';

  @override
  String get orderPin => '우선순위가 지정된 주문';

  @override
  String get orderUnpin => '일반 순서';

  @override
  String get outputFile => '파일 대상';

  @override
  String get parseFile => '파일 분석';

  @override
  String get password => '비밀번호';

  @override
  String get path => '파일 이름(저장 또는 로드할 파일 이름)';

  @override
  String get paymentType => '결제 간격';

  @override
  String get paymentsHeadline => '정기 결제';

  @override
  String get pearDisabled => '-- 비활성화됨 --';

  @override
  String get pearLoading => '진행 중...';

  @override
  String get peerAccept => '수락';

  @override
  String get peerAction => '동작';

  @override
  String get peerClosed => '종료됨';

  @override
  String get peerConnect => '장치 연결';

  @override
  String get peerConnectBtn => '연결';

  @override
  String get peerDelete => '삭제';

  @override
  String get peerDevice => '연결된 장치';

  @override
  String get peerId => '연결할 장치 식별자';

  @override
  String get peerOffline => '오프라인';

  @override
  String get peerOnline => '연결됨';

  @override
  String get peerOtherId => '연결용 장치 식별자';

  @override
  String get peerPending => '대기 중';

  @override
  String get peerPing => '핑';

  @override
  String get peerSent => '연결된 장치로 데이터가 전송됨';

  @override
  String get peerStatus => '상태';

  @override
  String get peerSync => '데이터 전송';

  @override
  String pickFile(Object value) {
    return '.$value-파일 선택';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid 에서 요청을 받음';
  }

  @override
  String get processIsFinished => '완료!';

  @override
  String progress(Object value) {
    return '진행 중입니다: $value%';
  }

  @override
  String get raiseData => '금액 추가';

  @override
  String get recoveryHeadline => '복구';

  @override
  String get recoveryTooltip => '복구 대상';

  @override
  String get releases => '릴리스';

  @override
  String get reset => '재설정';

  @override
  String get returnBack => '뒤로 돌아가기';

  @override
  String get roadmap => '로드맵';

  @override
  String get saveNotification => '변경 사항이 저장되었습니다!';

  @override
  String get saveSettingsTooltip => '저장';

  @override
  String get saveTooltip => '저장 대상';

  @override
  String search(Object value) {
    return '\'$value\' 패턴으로 표시';
  }

  @override
  String get searchTooltip => '찾다';

  @override
  String get settingsBaseHeadline => '기본 사항';

  @override
  String get settingsHeadline => '설정';

  @override
  String get skipFromTotals => '합계에서 제외';

  @override
  String get skipTooltip => '단계 건너뛰기';

  @override
  String get spent => '지출';

  @override
  String get splitCancelTooltip => '월별 분할 취소';

  @override
  String get splitTooltip => '월별 한도 선언';

  @override
  String get subscription =>
      '오픈소스 프로젝트이므로 구독한다고 해서 추가 기능이 제공되지는 않습니다. 하지만 애플리케이션의 지속적인 발전과 개선, 가용성 유지를 위한 투자로 활용될 수 있습니다.';

  @override
  String get subscriptionCoffee => '커피 구매';

  @override
  String get subscriptionDinner => '저녁 식사';

  @override
  String get subscriptionDonorbox => '도너박스를 통해 구독하기';

  @override
  String get subscriptionGithub => '깃허브를 통해 구독하기';

  @override
  String get subscriptionHeadline => '후원하기';

  @override
  String get subscriptionInactive => '구매 서비스 이용 불가';

  @override
  String get subscriptionPatreon => 'Patreon을 통해 구독';

  @override
  String get subscriptionPaypal => '커피 구매(PayPal)';

  @override
  String get subscriptionTiny => '행운의 코인 선물하기';

  @override
  String get subscriptionTooltip => '지원(스폰서십)';

  @override
  String get success => '성공';

  @override
  String get summary => '요약';

  @override
  String get symbol => '기호';

  @override
  String get syncHeadline => '장치 동기화';

  @override
  String get systemMode => '시스템';

  @override
  String get tapToOpen => '탭하여 열기';

  @override
  String get targetAmount => '목표 금액';

  @override
  String get termPrivacy => '개인정보 보호정책';

  @override
  String get termUse => '이용 약관';

  @override
  String get title => '제목';

  @override
  String get titleAccountTooltip => '계정 식별자 입력';

  @override
  String get titleBudgetTooltip => '예산 카테고리 이름 입력';

  @override
  String get titleGoal => '목표';

  @override
  String get titleGoalTooltip => '목표 설명 정의';

  @override
  String get to => '에';

  @override
  String get total => '합계';

  @override
  String get transactionFile => '핑프롬 트랜잭션 로그 파일(.log)';

  @override
  String get transferHeadline => '전송';

  @override
  String get transferTooltip => '전송 세부 정보 설정';

  @override
  String get transfersHeadline => '전송';

  @override
  String get typeButton => '버튼';

  @override
  String get updateAccountTooltip => '계정 업데이트';

  @override
  String get updateBillTooltip => '청구서 업데이트';

  @override
  String get updateBudgetTooltip => '예산 카테고리 업데이트';

  @override
  String get updateGoalTooltip => '목표 업데이트';

  @override
  String get updatePaymentTooltip => '결제 업데이트';

  @override
  String get username => '사용자 이름(계정)';

  @override
  String get uuid => '고유 거래 식별자';

  @override
  String get validTillDate => '유효 기간';

  @override
  String get webDav => '웹 분산 저작 및 버전 관리(WebDav)';

  @override
  String get zoomState => '줌인/줌아웃';
}
