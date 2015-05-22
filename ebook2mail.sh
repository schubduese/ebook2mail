#!/bin/bash

function doit {
  cd $1
  #Leerzeichen in Dateinamen durch Unterstriche ersetzen, geschieht nur weil mail sonst nur als Dateinamen das erste Wort nimm
  rename 's/\s/_/g' *

  #alle epub-Dateien konvertieren, Endung durch .mobi ersetzen
  for i in *.epub; do ebook-convert $i `basename $i .epub`.mobi; done

  #Alle Dateien als einzelne Mail versenden
  for i in *.mobi; do echo "" | mail -s "" -A $i $2;done
}

function showHelp {
	echo  -e "Das Skript benötigt 2 Eingabeparameter: Das Verzeichnis, indem die eBooks liegen sowie die eMail-Adresse\n Beispiel: ebook2mail . test@kindle.com\nAlle *.epub und *.mobi Dateien des aktuellen Verzeichnisses werden an die Adresse test@kindle.com gesendet"
}


if [ $# != 2 ] ; then
  showHelp
else
  doit $1 $2
fi
