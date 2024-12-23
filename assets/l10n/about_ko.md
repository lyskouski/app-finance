[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
한국어 (KO) |
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

광고와 제한이 없는 오픈 소스 크로스 플랫폼 재무 회계 애플리케이션 **Fingrom**.
이 솔루션의 목표는 직관적이고 효율적이며 포용적인 재무 회계 애플리케이션을 만드는 것입니다. 
이를 통해 사용자는 손쉽게 재정을 관리할 수 있으며, 누구도 뒤처지지 않도록 보장합니다.

[![동영상 보기](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

기능 ### 기능
- 회계(계정 유형, 통화/암호화폐)
  - 메인 페이지의 `/` 기호(이름)를 통한 간단한 그룹화
  - 거래 로그
  - 업데이트 날짜별 동결 금액(이전 내역 가져오기)
- 예산 카테고리
  - 메인 페이지의 `/`-기호(이름)를 통한 간단한 그룹화
  - 한도 재설정:
    - 매월 초에 갱신
    - 월별 구성 가능한 한도
    - 소득에 대한 친척(0.0 ... 1.0)의 비율
  - 또는 사용한 금액을 표시하여 제한없이
  - 다양한 타임라인: 주간, 월간, 연간
  - 사용자 정의 가능한 주 및 월의 시작일
- 청구서, 이체, 수입(송장)
  - 정기결제(홈 위젯 사용)
- 목표 정의
- 환율, 요약을 위한 기본 통화
- 지표 
  - 예산
    - 예측(몬테카를로 시뮬레이션 포함)
    - 예산 한도 및 월별 비용
  - 계정
    - 캔들스틱(OHLC) 차트
    - 수입 상태 레이더
    - 통화 분배
  - 청구서
    - YTD 비용
    - 카테고리별 바 레이스
  - 목표 게이지 차트
  - 통화 내역 차트
- 장치 간 동기화(P2P) 
- WebDav 또는 직접 파일을 통한 복구
- 청구서 및 송장에 대해 `CSV`, `QIF`, `OFX` 파일에서 가져 오기
- Excel `XLSX` 파일로 내보내기
- 데이터 암호화
- 로컬라이제이션
- 사용자 경험
  - 구성 가능한 메인 페이지(`폭 x 높이` 설정당 여러 가지 구성 가능)
  - 반응형 및 적응형 디자인
    - 적응형 탐색 패널(상단, 하단, 오른쪽) 및 탭(상단, 왼쪽)
  - 팔레트 정의(시스템, 사용자 지정, 개인-색상 선택기)가 있는 테마 모드(어둡게, 밝게, 시스템)
  - 계정, 예산 및 통화에 대한 마지막 선택 사항 유지
  - 양식에서 초점이 맞춰진 요소로 자동 스크롤
  - 메인 페이지의 섹션 확장/축소
  - 스와이프하면 편집 및 삭제 작업에 빠르게 액세스할 수 있습니다
  - “설정”을 통해 확대/축소(60%에서 최대 200%까지)
  - 단축키

| 설명               | 바로 가기             |
| ------------------ | -------------------- |
| 탐색 서랍 열기/닫기 | `Shift` + `Enter`    |
| 위로 이동하기       | `위쪽`               |
| 아래로 탐색하기     | `아래로`             |
| 선택 항목 열기      | `입력`               |
| 확대               | `Ctrl` + `+`         |
| 확대(마우스 사용)   | `Ctrl` + `스크롤다운` |
| 축소               | `Ctrl` + `-`         |
| 줌아웃(마우스 사용) | `Ctrl` + `스크롤업`   |
| 확대/축소 초기화    | `Ctrl` + `0`         |
| 새 트랜잭션 추가    | `Ctrl` + `N`         |
| 뒤로 돌아가기       | `Ctrl` + `백스페이스` |
<!--
| 선택한 항목 편집    | `Ctrl` + `E`         |
| 선택 항목 삭제      | `Ctrl` + `D`         |
-->
