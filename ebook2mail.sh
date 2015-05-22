#!/bin/bash

function doit {
  cd $1
  #Leerzeichen in Dateinamen durch Unterstriche ersetzen
  rename 's/\s/_/g' *

  #alle epub-Dateien konvertieren
  for i in *.epub; do ebook-convert '$i' '$i'.mobi; done

  #Alle Dateien als einzelne Mail versenden
  for i in *.mobi; do echo "" | mail -s "" -A $i $2;done
}

function showHelp {
	echo  -e "Das Skript benötigt 2 Eingabeparameter: Das Verzeichnis, indem die eBooks liegen sowie die eMail-Adresse"
}


if [ $# != 2 ] ; then
  showHelp
else
  doit $1 $2
fi
