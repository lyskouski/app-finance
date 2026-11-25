## Najnowsze zmiany

Jeśli aplikacja okazała się przydatna, nie zapomnij jej ocenić:
[lista sklepów z aplikacjami](https://github.com/lyskouski/app-finance/blob/main/README.md).

_Pełną listę aktualizacji można wyświetlić za pomocą elementu nawigacyjnego "O aplikacji" na przycisku "Wskazówki"._

### 8.5.0
- Dodano Teller (US): salda i import transakcji z amerykańskich banków i od wydawców kart z własną aplikacją Teller (na podstawie certyfikatu)
- Dodano Investec Programmable Banking (Republika Południowej Afryki): salda i import transakcji kont Private Banking z własnymi kluczami API
- Dodano Monzo Developer API (Wielka Brytania): salda i import transakcji z własnym klientem OAuth zatwierdzonym w aplikacji Monzo
- Dodano Starling Bank Personal Access (Wielka Brytania): salda i import transakcji z osobistym tokenem dostępu
- Dodano Akahu Personal App (Nowa Zelandia): salda i import transakcji nowozelandzkich banków połączonych z Akahu
- Dodano Up Banking API (Australia): salda i import transakcji kont wydatkowych i oszczędnościowych, przelewy między nimi jako przelewy
- Dodano Wise API (Global): salda i import transakcji wielowalutowych kont Wise, przewalutowania jako przelewy
- Dodano PrivatBank Autoclient (Ukraina): salda i import transakcji kont firmowych według IBAN
- Dodano monobank Personal API (Ukraina): salda i import transakcji kart i słoików, tworzenie powiązanych kont
- Dodano Parser powiadomień (Android): transakcje z powiadomień aplikacji bankowych i płatniczych, rozpoznawane automatycznie lub według własnego wzorca
- Przewidywanie kategorii budżetu dla importowanych rachunków bez kategorii w pliku

### 8.0.0
- Nowa strona Integracje z rozwijanymi sekcjami
- Dodano Financial Transaction Services (FinTS 4.1): konta, salda i import transakcji z niemieckich banków
- Dodano SimpleFIN Bridge (US): konta, salda i import transakcji z amerykańskich banków i od wydawców kart
- Dodano Enable Banking (EU): konta, salda i import transakcji z europejskich banków (PSD2)
- Dodano import plików wyciągów bankowych (`MT940`, `camt.053`), np. z polskich banków
- Poprawiono dokładność kursów przeliczeniowych

### 7.3.0
- Dodano lokalizację w języku indonezyjskim (ID)
- Poprawiono dokładność walutową w przypadku wymiany walut
- Naprawiono obliczenia szczegółowych informacji, inicjalizację uwierzytelniania biometrycznego oraz eksport do programu Excel
- Poprawiono działanie formularzy i klawiatury oraz stabilność aplikacji

### 7.2.0
- Dodawanie Gruzińskiego (KA) i Rosyjskiego (RU)

### 7.1.0
- Podsumowanie budżetu: opcja pomijania wartości ujemnych
- Podział rachunku
- Uwierzytelnianie biometryczne

### 7.0.2
- Ulepszona strona główna dostosowana zarówno do dużych, jak i małych ekranów

### 6.7.0
- Sortowanie budżetu/konta według nazwy, daty i kwoty
- Budżet > Podsumowanie: opcje klikalne umożliwiające sprawdzenie rachunków w danym przedziale czasowym

### 6.6.1
- Bezpieczeństwo: dodanie ochrony za pomocą jednorazowego hasła

### 6.5.0
- Wprowadzenie założenia/prognozy kategorii budżetowej dla rachunków

### 6.4.0
- Dodanie filtrów dla stron Rachunki, Faktury i Przelewy

### 6.3.0
- Dodanie stron Faktury i Przelewy

### 6.2.0
- Rozszerzenie płatności cyklicznych o interwał użytkownika

### 6.1.0
- Dodanie języków czeskiego (CS) i rumuńskiego (RO)

### 6.0.4
- Ulepszanie formularzy kursów wymiany

### 6.0.3
- Zmiana nawigacji podczas dodawania elementów (do poprzedniej strony zamiast głównej)

### 6.0.2
- Naprawa trybu edycji wydatków z giełdą

### 6.0.1
- Umożliwienie wymiany walut poniżej ułamków dziesiętnych

### 6.0.0
- Dodanie ekranu / widżetu domowego
- Poprawa budżetów względnych

### 5.9.2
- Poprawianie wykresów: kategoria wyścigu słupkowego, budżet od początku roku

### 5.9.1
- Poprawki formularza dla importu OFX

### 5.9.0
- Dodawanie płatności cyklicznych
- Ulepszenie importu OFX

### 5.8.0
- Eksport do pliku Excel `XLSX`
- Różne harmonogramy: tygodniowy, miesięczny, roczny
- Możliwość dostosowania dnia rozpoczęcia tygodnia i miesiąca

### 5.7.0
- Ulepszenie pamięci masowej dla wersji internetowej
- Dodanie języków holenderskiego (NL) i koreańskiego (KO)

### 5.6.2
- Naprawiono obliczenia na kartach podsumowania kont i budżetów

### 5.6.1
- Naprawiono orientację tekstu w lokalizacjach od prawej do lewej

### 5.6.0
- Ulepszenie stron wprowadzających
- Wprowadzenie zakładki podsumowania kont i budżetów
- Dodanie języków włoskiego (IT) i tureckiego (TR)

### 5.5.1
- Naprawiono odzyskiwanie z pliku .log dla systemu Android
- Dodanie języków japońskiego (JA) i hiszpańskiego (ES)

### 5.5.0
- Ulepszenie samodzielnie skonfigurowanej tablicy poprzez dodanie wykresów
- Dodanie języków arabskiego (AR) i azerskiego (AZ)

### 5.3.7
- Dodanie opcji "czyszczenie" dla procedury przywracania

### 5.3.6
- Rozwiązywanie ikon dla faktur

### 5.3.5
- Naprawiono fazę początkową dla elementów z wartościami bez części ułamkowych

### 5.3.4
- Rozwiązywanie problemów z kompilacją Linux Flathub

### 5.3.3
- Poprawa stylistyki przycisków

### 5.3.2
- Naprawianie utraty wymiany walut

### 5.3.1
- Poprawa lokalizacji w języku perskim

### 5.3.0
- Dodanie perskiej lokalizacji

### 5.2.6
- Resolving Linux Flatpak storage

### 5.2.4
- Dodanie waluty UZS (uzbecka suma) i uzbeckiej lokalizacji

### 5.2.2
- Zastąpienie selektora SDK niestandardową implementacją w celu rozwiązania problemu zawieszania się gry

### 5.2.0
- Naprawa błędu: operator sprawdzania wartości null użyty na wartości null
