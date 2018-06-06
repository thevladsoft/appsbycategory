> Version 1 of Zren's i18n scripts.

## Install Translations

Go to `~/.local/share/plasma/plasmoids/{{plasmoidName}}/locale/` and run `sh ./install`.

## New Translations

1. Fill out [`template.pot`](template.pot) with your translations then open a [new issue](https://github.com/Zren/plasma-applets/issues/new).

Or if you know how to make a pull request

1. Copy the `template.pot` file and name it your locale's code (Eg: `en`/`de`/`fr`) with the extension `.po`. Then fill out all the `msgstr ""`.

## Scripts

* `./merge` will parse the `i18n()` calls in the `*.qml` files and write it to the `template.pot` file. Then it will merge any changes into the `*.po` language files.
* `./install` It will then convert the `*.po` files to it's binary `*.mo` version and move it to `~/.local/share/locale/...`.
* `./test` will run `./merge` then `./install`.

## Links

* https://techbase.kde.org/Development/Tutorials/Localization/i18n_Build_Systems

## Examples

* https://websvn.kde.org/trunk/l10n-kf5/fr/messages/kde-workspace/
* https://github.com/psifidotos/nowdock-plasmoid/tree/master/po
* https://github.com/kotelnik/plasma-applet-redshift-control/tree/master/translations

## Status
|Locale | Lines | % Done|
|-------|-------|-------|
|Template	|86	|	|
|zh_CN	|70/86	|81%	|
|pl	|1/86	|1%	|
|fr	|27/86	|31%	|
|de	|46/86	|53%	|
|es	|80/86	|93%	|
