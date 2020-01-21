# Szivacs Napló

<img src="https://github.com/OliverParoczai/Szivacs-Naplo/blob/master/assets/icon.png" align="right"
     title="Szivacs Logó" width="180" height="180">
   
A Szivacs Napló: egy nyílt forráskódú multiplatformos kliensalkalmazás a magyar e-napló rendszerhez.

Ez az alkalmazás a *Boapps* által fejlesztett *Szivacs Napló forkja*, amely próbálja visszaállítani a **használhatóságot** és **hozzáadni új funkciókat**, amelyek az upstream branchben nem voltak elérhetőek.

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
<details><summary><b>Instrukciók megjelenítése</b></summary>
 
1. A forráskód klónozása egy helyi számítógépre: `git clone https://github.com/OliverParoczai/Szivacs-Naplo`

2. A letöltött forráskód mappájának megnyitása: `cd Szivacs-Naplo`

3. A forráskód megépítése: `flutter build apk --debug` vagy `flutter run`

</details>

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
