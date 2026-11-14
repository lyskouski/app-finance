// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/file_parser.dart';
import 'package:app_finance/_classes/storage/file_picker.dart';
import 'package:app_finance/_classes/storage/statement_parser.dart';
import 'package:flutter_test/flutter_test.dart';

// MT940 as exported by Polish banks (ZBP): structured `:86:` with `~` subfields
const mt940 = ''':20:ST261103
:25:/PL61109010140000071219812874
:28C:00001
:60F:C261101PLN1000,00
:61:2611021102D12,50NTRFNONREF//BR1
:86:020~00PRZELEW~20Zakupy spożywcze~3010901014~310000071219812874~32Piekarnia Żabka
:61:2611031103C2500,00NTRFNONREF//BR2
:86:034~00PRZELEW PRZYCHODZĄCY~20Wynagrodzenie 11/2026~32Pracodawca Sp. z o.o.
:62F:C261103PLN3487,50
-
''';

const camt053 = '''<?xml version="1.0" encoding="UTF-8"?>
<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.053.001.02">
  <BkToCstmrStmt>
    <GrpHdr><MsgId>M1</MsgId><CreDtTm>2026-11-04T10:00:00</CreDtTm></GrpHdr>
    <Stmt>
      <Id>S1</Id>
      <CreDtTm>2026-11-04T10:00:00</CreDtTm>
      <Acct><Id><IBAN>PL61109010140000071219812874</IBAN></Id><Ccy>PLN</Ccy></Acct>
      <Ntry>
        <Amt Ccy="PLN">12.50</Amt><CdtDbtInd>DBIT</CdtDbtInd><Sts>BOOK</Sts>
        <BookgDt><Dt>2026-11-02</Dt></BookgDt><ValDt><Dt>2026-11-02</Dt></ValDt>
        <NtryDtls><TxDtls>
          <Refs><EndToEndId>E2E-1</EndToEndId></Refs>
          <RltdPties><Cdtr><Nm>Piekarnia Żabka</Nm></Cdtr></RltdPties>
          <RmtInf><Ustrd>Zakupy spożywcze</Ustrd></RmtInf>
        </TxDtls></NtryDtls>
      </Ntry>
      <Ntry>
        <Amt Ccy="PLN">2500.00</Amt><CdtDbtInd>CRDT</CdtDbtInd><Sts>BOOK</Sts>
        <BookgDt><Dt>2026-11-03</Dt></BookgDt><ValDt><Dt>2026-11-03</Dt></ValDt>
        <NtryDtls><TxDtls>
          <Refs><EndToEndId>E2E-2</EndToEndId></Refs>
          <RltdPties><Dbtr><Nm>Pracodawca Sp. z o.o.</Nm></Dbtr></RltdPties>
          <RmtInf><Ustrd>Wynagrodzenie 11/2026</Ustrd></RmtInf>
        </TxDtls></NtryDtls>
      </Ntry>
      <Ntry>
        <Amt Ccy="PLN">5.00</Amt><CdtDbtInd>DBIT</CdtDbtInd><Sts>PDNG</Sts>
        <ValDt><Dt>2026-11-04</Dt></ValDt>
      </Ntry>
    </Stmt>
  </BkToCstmrStmt>
</Document>
''';

// Single-byte encodings of the text, as Polish banks export it
Uint8List encode(String text, Map<int, int> polish) =>
    Uint8List.fromList([for (final rune in text.runes) rune < 0x80 ? rune : polish[rune]!]);

const windows1250 = {0x017C: 0xBF, 0x017B: 0xAF, 0x0105: 0xB9, 0x0104: 0xA5, 0x015B: 0x9C};
const iso88592 = {0x017C: 0xBF, 0x017B: 0xAF, 0x0105: 0xB1, 0x0104: 0xA1, 0x015B: 0xB6};

void main() {
  group('StatementParser.decode', () {
    const text = 'Zakupy: Żabka, ąĄś Żż';

    test('reads UTF-8, also with a byte order mark', () {
      final bytes = utf8.encode(text);
      expect(StatementParser.decode(Uint8List.fromList(bytes)), text);
      expect(StatementParser.decode(Uint8List.fromList([0xEF, 0xBB, 0xBF, ...bytes])), text);
    });

    test('tells Windows-1250 from ISO-8859-2 by the Polish letters', () {
      expect(StatementParser.decode(encode(text, windows1250)), text);
      expect(StatementParser.decode(encode(text, iso88592)), text);
    });

    test('follows the encoding an XML file declares', () {
      final xml = '<?xml version="1.0" encoding="ISO-8859-2"?><a>ąś</a>';
      expect(StatementParser.decode(encode(xml, iso88592)), xml);
    });
  });

  group('StatementParser.parse', () {
    test('reads Polish MT940 with structured details', () {
      final (:rows, :pending) = StatementParser.parse(StatementParser.mt940Format, utf8.encode(mt940));

      expect(rows.first, StatementParser.header);
      expect(rows.length, 3);
      expect(pending, 0);
      final bill = rows[1];
      expect(bill.sublist(1), [
        '12.5',
        'Piekarnia Żabka — Zakupy spożywcze',
        '2026-11-02',
        AppLocale.labels.bill,
        'PLN',
        'PL61109010140000071219812874',
      ]);
      expect(rows[2][1], '2500.0');
      expect(rows[2][2], 'Pracodawca Sp. z o.o. — Wynagrodzenie 11/2026');
      expect(rows[2][4], AppLocale.labels.flowTypeInvoice);
    });

    test('reads MT940 exported in Windows-1250', () {
      final (:rows, pending: _) = StatementParser.parse(
          StatementParser.mt940Format,
          encode(mt940, {
            ...windows1250,
            0x0119: 0xEA, // ę
            0x0104: 0xA5, // Ą
            0x0105: 0xB9, // ą
            0x0106: 0xC6, // Ć
            0x0107: 0xE6, // ć
            0x0179: 0x8F, // Ź
            0x017A: 0x9F, // ź
            0x0141: 0xA3, // Ł
            0x0142: 0xB3, // ł
            0x0143: 0xD1, // Ń
            0x0144: 0xF1, // ń
            0x00D3: 0xD3, // Ó
            0x00F3: 0xF3, // ó
            0x015A: 0x8C, // Ś
            0x015B: 0x9C, // ś
            0x017B: 0xAF, // Ż
            0x017C: 0xBF, // ż
          }));

      expect(rows[1][2], 'Piekarnia Żabka — Zakupy spożywcze');
    });

    test('reads camt.053, counting pending entries', () {
      final (:rows, :pending) = StatementParser.parse(StatementParser.camtFormat, utf8.encode(camt053));

      expect(rows.length, 3);
      expect(pending, 1);
      expect(rows[1].sublist(1), [
        '12.5',
        'Piekarnia Żabka — Zakupy spożywcze',
        '2026-11-02',
        AppLocale.labels.bill,
        'PLN',
        'PL61109010140000071219812874',
      ]);
      expect(rows[2][2], 'Pracodawca Sp. z o.o. — Wynagrodzenie 11/2026');
    });

    test('derives the same uuids on every import', () {
      final first = StatementParser.parse(StatementParser.camtFormat, utf8.encode(camt053)).rows;
      final second = StatementParser.parse(StatementParser.camtFormat, utf8.encode(camt053)).rows;

      expect(first.skip(1).map((e) => e.first), second.skip(1).map((e) => e.first));
      expect(first.skip(1).map((e) => e.first).toSet().length, 2);
    });

    test('refuses a statement whose balances do not add up', () {
      final broken = mt940.replaceFirst(':62F:C261103PLN3487,50', ':62F:C261103PLN9999,99');

      expect(
        () => StatementParser.parse(StatementParser.mt940Format, utf8.encode(broken)),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('FilePicker.parseStatement', () {
    test('maps the statement columns for the import', () {
      final picker = FilePicker([StatementParser.camtFormat]);
      final rows = picker.parseStatement(StatementParser.camtFormat, utf8.encode(camt053));

      expect(rows.length, 3);
      expect(picker.pending, 1);
      expect(picker.columnMap, [
        FileParser.attrBillUuid,
        FileParser.attrBillAmount,
        FileParser.attrBillComment,
        FileParser.attrBillDate,
        FileParser.attrBillType,
        FileParser.attrBillCurrency,
        '',
      ]);
    });
  });
}
