Potrzeba klienta
System do analizy czêstoœci tekstu, która pozwoli okreœliæ, jakie s³owa i tematy dominuj¹ w pliku tekstowym (tu przemówienia Bidena z 2021 i 2024), a tak¿e wskazaæ ró¿nice w sposobie przekazu i priorytetach prezydenta w danym wyst¹pieniu. System ma wizualizowaæ wyniki.

Etapy procesu tworzenia systemu informatycznego
1.	Planowanie
Celem analizy jest identyfikacja i porównanie najczêœciej wystêpuj¹cych s³ów w przemówieniu (tu prezydenta Joe Bidena). Analiza pozwoli okreœliæ dominuj¹ce tematy oraz potencjalne podobieñstwa/ró¿nice dla ka¿dego przemówienia. 
2.	Analiza (wymagañ)
Proces obejmie ekstrakcjê tekstu, jego wstêpne przetworzenie oraz analizê czêstoœci wystêpowania s³ów, a tak¿e wizualizacjê wyników w formie chmur s³ów oraz wykresów s³upkowych.
3.	Projektowanie
Przygotowanie metod analizy tekstu i wizualizacji wyników
1.	Wczytanie tekstu przemówieñ – import pliku tekstowego zawieraj¹cego przemówienie.
2.	Przetwarzanie tekstu – oczyszczenie danych, usuniêcie znaków interpunkcyjnych i konwersja tekstu do postaci tokenów.
3.	Usuniêcie stop s³ów – eliminacja s³ów o wysokiej czêstoœci, ale niskiej wartoœci analitycznej (np. „i”, „oraz”, „dla”).
4.	Analiza czêstoœci s³ów – identyfikacja i porównanie najczêœciej wystêpuj¹cych terminów w obu przemówieniach.
5.	Wizualizacja wyników:
  o	Wykresy s³upkowe – przedstawienie najczêœciej u¿ywanych s³ów i ich liczebnoœci.
o	Chmury s³ów – graficzne zobrazowanie czêstoœci s³ów, gdzie wiêksza czcionka oznacza wy¿sze wystêpowanie.
o	Porównanie wyników – zestawienie najwa¿niejszych ró¿nic miêdzy przemówieniami pod k¹tem s³ownictwa i tematów.

4.	Implementacja -wytworzenie kodu systemu

Zadanie: rozsypanka
Rozwi¹zanie (kod) nie jest uporz¹dkowane. Zidentyfikuj kolejnoœæ i uporz¹dkuj proces implementacji i kodoania tworzenia systemu informatycznego, a nastêpnie uruchom kod i wykonaj analizy dla obu plików tekstowych (przemówieñ Bidena z 2021 i 2024). Czy priorytety wykryte w obu przemówieniach s¹ podobne czy ró¿ni¹ siê?
  
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
  
  # Tworzenie chmury s³ów za pomoc¹ pakietu wordcloud
  install.packages("wordcloud")
  library(wordcloud)
  
  # Opcje chmury s³ów
  ?wordcloud
  # Zmiana wartoœci min.freq i max.words w celu wyœwietlenia mniejszej/wiêkszej liczby s³ów.
  # min.freq: s³owa o czêstoœci poni¿ej tej wartoœci nie bêd¹ wyœwietlane
  # max.words: maksymalna liczba s³ów do wyœwietlenia
  
  # Utwórz chmurê s³ów
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ)
  
  # Ograniczenie liczby s³ów w chmurze poprzez okreœlenie minimalnej czêstoœci
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4)
  
  # Ograniczenie liczby s³ów w chmurze poprzez okreœlenie maksymalnej liczby s³ów
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5)
  
  
  #5.
  
  # Optymalizacja i dostosowanie wyników
  # Dodanie koloru do chmury s³ów dla lepszej wizualizacji
  # Dodanie koloru
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))
  # Dodanie koloru
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))
  ?brewer.pal
  brewer.pal.info
   
  # Dodanie ró¿nych palet kolorystycznych
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))
  wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))




