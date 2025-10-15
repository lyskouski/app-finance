[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
Français (FR) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
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

**Fingrom** -- application de comptabilité financière multiplateforme à code source ouvert, sans annonces ni limitations.
L'objectif de la solution est de créer une application de comptabilité financière qui soit intuitive, efficace et inclusive.
Elle permet aux utilisateurs de gérer leurs finances sans effort, tout en veillant à ce que personne ne soit laissé pour compte.

[![Voir la vidéo](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Fonctionnalité
- Comptabilité (Type de compte, Devise/Cryptocurrency)
  - Regroupement simple via le symbole `/` (dans le nom) pour la page principale
  - Journal des transactions
  - Gel du montant par date de mise à jour (pour importer l'historique précédent)
- Catégories de budget
  - Regroupement simple via le symbole `/` (dans le nom) pour la page principale
  - Avec des limites à respecter :
    - Renouvelé au début de chaque mois
    - Limites configurables par mois
    - Relatives (0.0 ... 1.0) au revenu
  - Ou, sans limites en affichant un montant dépensé
  - Différents calendriers : hebdomadaire, mensuel, annuel
  - Jour de début de la semaine et du mois personnalisable
- Factures, transferts, revenus (factures)
  - Paiements récurrents (avec un widget)
  - Filtrage
  - Hypothèse/prévision budgétaire par catégorie
- Définition des objectifs
- Taux de change, devise par défaut pour le résumé
- Métriques :
  - Budget :
    - Prévisions (avec simulation de Monte Carlo)
    - Limite budgétaire et dépenses par mois
  - Compte :
    - Graphique en chandelier (OHLC)
    - Radar de santé des revenus
    - Distribution des devises
  - Factures :
    - Dépenses YTD
    - Bar Race pour les catégories
  - Graphique de la jauge des objectifs
  - Graphique historique des devises
- Synchronisation entre appareils (P2P)
- Récupération via WebDav ou un fichier direct
- Importation à partir de fichiers CSV, QIF, OFX pour les factures
- Export vers un fichier Excel `XLSX`
- Cryptage des données
- Localisation des données
- Expérience utilisateur
  - Page principale configurable (plusieurs configurations par jeu de `largeur x hauteur`)
  - Design réactif et adaptatif
    - Panneau de navigation adaptatif (en haut, en bas, à droite) et onglets (en haut, à gauche)
  - Mode thème (sombre, clair, système) avec définition de la palette (système, personnalisé, personnel -- sélecteur de couleurs)
  - Conserver le dernier choix pour le compte, le budget et la devise
  - Défilement automatique vers l'élément focalisé sur le formulaire
  - Développer / Réduire les sections sur la page principale
  - Glissement pour un accès rapide aux actions de modification et de suppression
  - Zoom avant/arrière (de 60 % à 200 %) via « Paramètres »
  - Raccourcis

| Description                              | Raccourci                      |
| ---------------------------------------- | ------------------------------ |
| Ouvrez / fermez le tiroir de navigation  | `Shift` + `Enter`              |
| Naviguer vers le haut                    | `vers le haut`                 |
| Naviguer vers le bas                     | `vers le bas`                  |
| Ouvrez la sélection                      | `Enter`                        |
| Zoom avant                               | `Ctrl` + `+`                   |
| Zoom avant (avec la souris)              | `Ctrl` + `défiler vers le bas` |
| Zoom arrière                             | `Ctrl` + `-`                   |
| Zoom arrière (avec la souris)            | `Ctrl` + `défiler vers le haut`|
| Réinitialiser le zoom                    | `Ctrl` + `0`                   |
| Ajouter une nouvelle transaction         | `Ctrl` + `N`                   |
| Retourner en arrière                     | `Ctrl` + `Backspace`           |
<!--
| Modifier l'élément sélectionné           | `Ctrl` + `E`                   |
| Supprimer l'élément sélectionné          | `Ctrl` + `D`                   |
-->
