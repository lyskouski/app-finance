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
Italiano (IT) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- applicazione di contabilità finanziaria multipiattaforma open-source senza annunci e limitazioni.
L'obiettivo della soluzione è creare un'applicazione di contabilità finanziaria che sia intuitiva, efficiente e inclusiva.
Che permetta agli utenti di gestire le proprie finanze senza sforzo, garantendo al contempo che nessuno venga lasciato indietro.

[![Guarda il video](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funzionalità
- Contabilità (tipo di conto, valuta/criptovaluta)
  - Raggruppamento semplice tramite il simbolo `/` (nel nome) per la pagina principale
  - Registro delle transazioni
  - Congelamento dell'importo per data di aggiornamento (per importare la cronologia precedente)
- Categorie di bilancio
  - Raggruppamento semplice tramite `/`-simbolo (nel nome) per la pagina principale
  - Con limiti rideterminati:
    - Rinnovati all'inizio di ogni mese
    - Limiti configurabili per mese
    - Parenti (0,0 ... 1,0) al reddito
  - Oppure, senza limiti, mostrando un importo speso
  - Cronologia diversa: settimanale, mensile, annuale
  - Giorno di inizio della settimana e del mese personalizzabili
- Bollette, trasferimenti, entrate (fatture)
  - Pagamenti ricorrenti (con un widget)
  - Filtraggio
  - Ipotesi/previsioni relative alla categoria di bilancio
- Definizione degli obiettivi
- Tassi di cambio, Valuta predefinita per il riepilogo
- Metriche:
  - Bilancio:
    - Previsione (con simulazione Monte Carlo)
    - Limite di budget e spese per mese
  - Conto:
    - Grafico a candele (OHLC)
    - Radar della salute del reddito
    - Distribuzione della valuta
  - Fatture:
    - Spese YTD
    - Gara a barre per categorie
  - Grafico degli obiettivi
  - Grafico storico della valuta
- Sincronizzazione tra dispositivi (P2P)
- Recupero tramite WebDav o file diretto
- Importazione da file `CSV`, `QIF`, `OFX` per fatture e bollette
- Esportazione in file Excel `XLSX`
- Cifratura dei dati
- Localizzazione
- Esperienza utente
  - Pagina principale configurabile (configurazioni multiple per set di `larghezza x altezza`)
  - Design reattivo e adattivo
    - Pannello di navigazione adattativo (in alto, in basso, a destra) e schede (in alto, a sinistra)
  - Modalità tema (scuro, chiaro, di sistema) con definizione della tavolozza (sistema, personalizzata, personale -- selettore dei colori)
  - Conservazione dell'ultima scelta per Conto, Bilancio e Valuta
  - Scorrimento automatico verso l'elemento focalizzato nel modulo
  - Espansione/riduzione delle sezioni nella pagina principale
  - Scorrimento per un accesso rapido alle azioni di Modifica e Cancellazione
  - Zoom in/out (dal 60% al 200%) tramite “Impostazioni”
  - Scorciatoie

| Descrizione                              | Scorciatoia                    |
| ---------------------------------------- | ------------------------------ |
| Apri / Chiudi il cassetto di navigazione | `Shift` + `Enter`              |
| Naviga verso l'alto                      | `su`                           |
| Naviga verso il basso                    | `giù`                          |
| Apri selezionato                         | `Enter`                        |
| Zoom avanti                              | `Ctrl` + `+`                   |
| Zoom avanti (con il mouse)             | `Ctrl` + `scorri verso il basso` |
| Zoom indietro                            | `Ctrl` + `-`                   |
| Zoom indietro (con il mouse)             | `Ctrl` + `scorri verso l'alto` |
| Reimposta zoom                           | `Ctrl` + `0`                   |
| Aggiungi nuova transazione               | `Ctrl` + `N`                   |
| Torna indietro                           | `Ctrl` + `Backspace`           |
<!--
| Modifica elemento selezionato            | `Ctrl` + `E`                   |
| Elimina elemento selezionato             | `Ctrl` + `D`                   |
-->
