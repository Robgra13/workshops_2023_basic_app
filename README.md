# Biblioteczka

Aplikacja warsztatowa

Kilka słów o startowej apce:
- aplikacja 'biblioteczna'
- pozwala na rejestrację (logowanie, itd.) użytkowników
- dodawanie książek, podgląd, usuwanie
- ...ich wypożyczanie
- ...oraz rezerwację książek już wypożyczonych
- w każdej chwili użytkownik może podejrzeć swoje wypożyczenia/rezerwacje

# Getting Started

- Ruby 3.2.2
- Rails 7.0.4.3
- Baza danych - SQLite
- Devise do obsługi użytkowników, sesji
- dodatkowo wpięte:
  - Letter opener (podgląd maili)
  - Rspec (bazowe testy)
  - FactoryBot (budowanie danych w testach)
  - Faker (fake-owe dane)
  - Rubocop (Twój strażnik czystego kodu)

1.  Aplikacja połączona w Ruby on Rails z API pogodowym dostarczanym przez https://www.weatherapi.com, aby:

  Wyświetlić bieżące dane pogodowe w aplikacji (temperatura, tekstowy opis, ikonka pokazująca graficzną reprezentację opisu),
  Wyświetlić odpowiedni tekst uzależniony od pogody.

2. Integracja aplikacji kalendarzem Google (API, OAuth)

  I. Umożliwienie logowania się w aplikacji za pomocą konta Google.

  II. Utworzenie eventu w kalendarzu Google zalogowanego użytkownika:
  event pojawia się w kalendarzu tuż po akcji wypożyczenia książki,
  event widoczny jest w kalendarzu w dacie sugerowanego terminu oddania książki, umownie ustalone 2 tygodnie.

3. Zadania w tle (Redis, Sidekiq, Cron)

  I. Po wypożyczeniu książki w tle wysyłany jest użytkownikowi email informujący o udanym wypożyczeniu i założonej z góry dacie oddania książki. W tym celu potrzebny był gem Sidekiq do przetwarzania zadań w tle. Oprócz tego stworzona klasa mailera oraz templatka(szablon) wiadomości.

  II. Zakolejkowanie wiadomości z informacją mailową dla użytkownika o tym, że termin oddania książki mija jutro.

4. Wysyłanie logów dotyczących działań użytkownika za pomocą systemu kolejkowania (RabbitMQ, bunny, sneakers).

  Publikowanie zdarzeń/logów do kolejki rabbitowej z basic_app
  Konsumowanie wiadomości z kolejki i zapis zdarzeń w side_app (dostępna w oddzielnym repo)

5. Hotwire

  I. Dynamiczne usuwanie elementów z listy (broadcasting)
  Jeśli ktoś w naszej aplikacji usunie książkę, to inni zalogowani użytkownicy nie powinni jej już widzieć na liście.

  II. Dynamiczne doładowywanie zawartości strony (kaminari + turbo frame)
  Jak biblioteka się rozrośnie, to aby nie ładować na stronie Books wszystkich rekordów wdrożymy paginację, użyjemy do tego gema kaminari a następnie zmienimy paginację, w doczytywaną automatycznie listę.

  III. Wyszukiwarka (stimulus)
  Mamy coraz więcej książek, aby ułatwić użytkownikom szukanie interesujących tytułów, dodaję wyszukiwarkę.

  IV. Umożliwienie tzw 'inline edition' dla książek (na przykładzie ilości stron)
  Chcemy, żeby bez przeładowania strony użytkownik mógł zmienić ilość stron w książce, na jej podglądzie.

6. Implemetacja narzędzia Capybara do testowania interfejsu.

Integracja z przeglądarką Chrome,
Przykładowy test logowania (próba logowania nieprawidłowymi danymi),
Przykładowy test logowania (próba logowania prawidłowymi danymi).
