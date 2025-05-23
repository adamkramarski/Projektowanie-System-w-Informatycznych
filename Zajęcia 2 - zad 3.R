Potrzeba klienta
System do analizy cz�sto�ci tekstu, kt�ra pozwoli okre�li�, jakie s�owa i tematy dominuj� w pliku tekstowym (tu przem�wienia Bidena z 2021 i 2024), a tak�e wskaza� r�nice w sposobie przekazu i priorytetach prezydenta w danym wyst�pieniu. System ma wizualizowa� wyniki.

Etapy procesu tworzenia systemu informatycznego
1.	Planowanie
Celem analizy jest identyfikacja i por�wnanie najcz�ciej wyst�puj�cych s��w w przem�wieniu (tu prezydenta Joe Bidena). Analiza pozwoli okre�li� dominuj�ce tematy oraz potencjalne podobie�stwa/r�nice dla ka�dego przem�wienia. 
2.	Analiza (wymaga�)
Proces obejmie ekstrakcj� tekstu, jego wst�pne przetworzenie oraz analiz� cz�sto�ci wyst�powania s��w, a tak�e wizualizacj� wynik�w w formie chmur s��w oraz wykres�w s�upkowych.
3.	Projektowanie
Przygotowanie metod analizy tekstu i wizualizacji wynik�w
1.	Wczytanie tekstu przem�wie� � import pliku tekstowego zawieraj�cego przem�wienie.
2.	Przetwarzanie tekstu � oczyszczenie danych, usuni�cie znak�w interpunkcyjnych i konwersja tekstu do postaci token�w.
3.	Usuni�cie stop s��w � eliminacja s��w o wysokiej cz�sto�ci, ale niskiej warto�ci analitycznej (np. �i�, �oraz�, �dla�).
4.	Analiza cz�sto�ci s��w � identyfikacja i por�wnanie najcz�ciej wyst�puj�cych termin�w w obu przem�wieniach.
5.	Wizualizacja wynik�w:
  o	Wykresy s�upkowe � przedstawienie najcz�ciej u�ywanych s��w i ich liczebno�ci.
o	Chmury s��w � graficzne zobrazowanie cz�sto�ci s��w, gdzie wi�ksza czcionka oznacza wy�sze wyst�powanie.
o	Por�wnanie wynik�w � zestawienie najwa�niejszych r�nic mi�dzy przem�wieniami pod k�tem s�ownictwa i temat�w.

4.	Implementacja -wytworzenie kodu systemu

Zadanie: rozsypanka
Rozwi�zanie (kod) nie jest uporz�dkowane. Zidentyfikuj kolejno�� i uporz�dkuj proces implementacji i kodoania tworzenia systemu informatycznego, a nast�pnie uruchom kod i wykonaj analizy dla obu plik�w tekstowych (przem�wie� Bidena z 2021 i 2024). Czy priorytety wykryte w obu przem�wieniach s� podobne czy r�ni� si�?
  
 # 1.
  
  # Wczytaj dane tekstowe
  # Wczytaj plik tekstowy z lokalnego dysku
  text <- readLines(file.choose())
  text
  
  #2.
 
  library(qdap) 
  frequent_terms <- freq_terms(text)
  frequent_terms
  frequent_terms <- freq_terms(text, stopwords = Top200Words)
  plot(frequent_terms)
  
  #3.
  
  # Tworzenie chmury s��w za pomoc� pakietu wordcloud
  install.packages("wordcloud")
  library(wordcloud)
  
  # Opcje chmury s��w
  ?wordcloud
  # Zmiana warto�ci min.freq i max.words w celu wy�wietlenia mniejszej/wi�kszej liczby s��w.
  # min.freq: s�owa o cz�sto�ci poni�ej tej warto�ci nie b�d� wy�wietlane
  # max.words: maksymalna liczba s��w do wy�wietlenia
  
  # Utw�rz chmur� s��w
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ)
  
  # Ograniczenie liczby s��w w chmurze poprzez okre�lenie minimalnej cz�sto�ci
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4)
  
  # Ograniczenie liczby s��w w chmurze poprzez okre�lenie maksymalnej liczby s��w
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5)
  
  
  #5.
  
  # Optymalizacja i dostosowanie wynik�w
  # Dodanie koloru do chmury s��w dla lepszej wizualizacji
  # Dodanie koloru
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))
  # Dodanie koloru
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))
  ?brewer.pal
  brewer.pal.info
   
  # Dodanie r�nych palet kolorystycznych
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))




