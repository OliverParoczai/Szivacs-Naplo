# Szivacs Napló

A Szivacs Napló: egy multiplatformos kliensalkalmazás az e-napló rendszerhez.

Ez az app a Boapps által befejezett Szivacs Napló forkja, amely próbálja visszaállítani a használhatóságot és hozzáadni új funkciókat, amelyek az upstream branchben nem voltak elérhetőek.

Sosem lesznek reklámok vagy nem-szabad komponensek a programban, mivel szerintem szabadságot kellene előnybe részesíteni egy olyan alkalmazásnál, amit minden tanulónak kötelező használni.

#### Jelenlegi funkciók:

* "faliújság"
* jegyek
* órarend
* hiányzások
* átlagok
* egyszerre több fiók kezelése
* gyors, logikus, modern felület
* sötét téma és személyre szabható színek
* értesítések
* grafikonok

#### Feljesztés alatt:

 * Egy letisztultabb, kevesebb dependency-t követelő felhasználói felület.
 * Kisebb hibajavítások
 * Linux kompatibilitás, a Linuxos mobiltelefonok érdekében

## Telepítés

#### Építés forráskódból:
* `git clone https://github.com/OliverParoczai/Szivacs-Naplo`
* `cd Szivacs-Naplo`
* `flutter build apk --debug` vagy `flutter run`

#### Android:

Még nincs F-Droid-ra feltöltve, de dolgozok rajta

#### iOS:

Az alkalmazás működik iOS-en is, mivel Flutterben készült.

Ennek ellenére [hajducsekb](https://github.com/hajducsekb) legyártott egy [.ipa fájlt](https://www.dropbox.com/s/3vzrqagpfhb6g8l/flutter_naplo.ipa?dl=0), amit Cydia Impactorral fel lehet telepíteni. [További infó a telepítésről](https://github.com/boapps/e-Szivacs-2/issues/30)

## Felhasznált nyílt forráskódú projectek:

* [Flutter](https://github.com/flutter/flutter) - alkalmazásfejlesztési keretrendszer (ezzel csináltam az appot)
* [Fira GO](https://github.com/bBoxType/FiraGO) - betűtípus
* Flutter kiegészítők:
  * [dynamic_theme](https://github.com/Norbert515/dynamic_theme) - a sötét témához
  * [Fluro](https://github.com/theyakka/fluro)
  * [Flutter Launcher Icons](https://github.com/fluttercommunity/flutter_launcher_icons)
  * [charts_flutter](https://github.com/google/charts)
  * [Flutter Local Notifications Plugin](https://github.com/MaikuB/flutter_local_notifications)
  * [flutter_html_view](https://github.com/PonnamKarthik/FlutterHtmlView)
  * [html_unescape](https://github.com/filiph/html_unescape)
  * [background_fetch](https://github.com/transistorsoft/flutter_background_fetch)

## Licensz:

A szoftver a BSD-2 Clause szoftverlicensz alatt érhető el, amely megtalálható a [LICENSE](https://github.com/OliverParoczai/Szivacs-Naplo/blob/master/LICENSE) fájlban.
