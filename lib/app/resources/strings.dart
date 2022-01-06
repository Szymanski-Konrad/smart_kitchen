abstract class Strings {
  // General
  static const String appTitle = 'Smart Kitchen';
  static const String save = 'Zapisz';
  static const String unknownError =
      'Wystąpił nieoczekiwany błąd, spróbuj ponownie';
  static const String cancel = 'Anuluj';
  static const String edit = 'Edytuj';

  // Auth pages
  static const String signInTitle = 'Logowanie';
  static const String signIn = 'Zaloguj się';
  static const String signUp = 'Zarejestruj się';
  static const String signOut = 'Wyloguj się';
  static const String googleSignIn = 'Google';
  static const String email = 'Email';
  static const String password = 'Hasło';
  static const String userName = 'Nazwa użytkownika';

  static const String emailValidationFail = 'Niepoprawny email';
  static const String shortPassword = 'Za krótkie hasło';
  static const String shortUserName = 'Nazwa użytkownika jest za krótka';
  static const String userNameIsBusy = 'Nazwa użytkownika jest zajęta';

  // Auth errors
  static const String emailAlreadyInUse = 'Podany email jest już zajęty';

  // Recipes home
  static const String searchRecipe = 'Wyszukaj przepis...';
  static const String newRecipe = 'Nowy przepis';
  static const String randomRecipe = 'Losowy przepis';
  static const String fromFridge = 'Z lodówki';
  static const String noRecipes = 'Brak przepisów';

  // Bottom navigation bar
  static const String basket = 'Koszyk';
  static const String recipes = 'Przepisy';
  static const String products = 'Produkty';
  static const String planner = 'Planer';
  static const String profile = 'Profil';

  // Categories
  static const String breakfast = 'Śniadanie';
  static const String lunch = 'Obiad';
  static const String dinner = 'Kolacja';
  static const String cocktail = 'Koktajl';
  static const String dessert = 'Deser';
  static const String cake = 'Ciasto';
  static const String fish = 'Ryba';
  static const String salad = 'Sałatka';
  static const String drink = 'Drink';
  static const String jam = 'Konfitura';
  static const String notAssigned = 'Inna';

  // Recipe details page
  static const String ingredients = 'Składniki';
  static const String sections = 'Sekcje';
  static const String cookSteps = 'Przygotowanie';
  static const String rating = 'Ocena';
  static const String rate = 'Oceń';
  static const String letsCook = 'Gotujmy!';
  static const String nutritionFacts = 'Wartości odżywcze';
  static String nutritions(int calculated, int all) =>
      '$nutritionFacts ($calculated z $all)';
  static const String servings = 'Porcje';
  static const String calories = 'Kalorie';
  static const String recipeProportions = 'Proporcje składników';
  static const String change = 'Zmień';
  static const String steps = 'kroków';
  static const String min = 'min';
  static const String send = 'Prześlij';

  // Burnt calories dialog
  static String activitesTime(double kcal) =>
      'Czas aktywności aby spalić $kcal kalorii';
  static const String stairsWalking = 'Chodzenie po schodach';
  static const String running = 'Bieganie';
  static const String bike = 'Rower';
  static const String sleep = 'Sen';
  static const String crunches = 'Brzuszki';
  static const String stepping = 'Kroki';
  static const String stationaryBike = 'Rower stacjonarny';
  static const String gym = 'Siłownia';
  static const String swimming = 'Pływanie';

  // New recipe page
  static const String image = 'Zdjęcie';
  static const String recipeName = 'Nazwa przepisu';
  static const String category = 'Kategoria';
  static const String notes = 'Notatki';
  static const String fromLibrary = 'Galeria';
  static const String fromAparat = 'Aparat';
  static const String photoOptions = 'Wybierz opcję';
  static const String addPhoto = 'Dodaj zdjęcie';
  static const String replacePhoto = 'Zmień zdjęcie';
  static const String removePhoto = 'Usuń zdjęcie';
  static const String recipeNameHint = 'Podaj nazwę przepisu...';
  static const String selectCategory = 'Wybierz kategorię';
  static const String notesHint = 'Podaj notatki do przepisu (opcjonalnie)';
  static const String emptyIngredientsList = 'Lista składników jest pusta';
  static const String emptyRecipeStepsList = 'Lista kroków jest pusta';
  static const String section = 'sekcja';
  static const String ingredient = 'składnik';
  static const String cookStep = 'krok';
  static const String newIngredientHint = 'Wprowadź nowy składnik';
  static const String editIngredient = 'Edytuj składnik';
  static const String newCookStepHint = 'Wprowadź kolejny etap przygotowania';
  static const String editCookStep = 'Edytuj etap';
  static const String info = 'Informacje';
  static const String ingredientsAndSteps = 'Sładniki & kroki';

  // New recipe step
  static const String editRecipeStepContent = 'Edytuj opis';
  static const String setRecipeStepTimer = 'Ustaw czasomierz';
  static const String timer = 'Minutnik';
  static const String setRecipeStepIngredients = 'Przypisz składniki';
  static const String noTimerSet = 'nie ustawiony';
  static String unusedIngredientsCount(int count) =>
      'Nieprzypisane składniki: $count';

  // Cooking screen
  static const String prepareIngredients = 'Przygotuj składniki';
  static const String letsStart = 'Zaczynajmy';
  static String stepState(int current, int all) => '$current of $all';
  static const String summary = 'Podsumowanie';
  static const String nextStep = 'Następny krok';
  static const String cookingEnd = 'Koniec gotowania';
  static String cookingTime(Duration cookTime) =>
      'Czas gotowania: ${cookTime.toString().split('.').first.padLeft(8, "0")}';
  static const String back = 'Powrót';
  static const String addMinute = 'Dodaj minutę';
  static const String pause = 'Wstrzymaj';
  static const String resume = 'Wznów';
  static const String start = 'Rozpocznij';
  static const String runTimer = 'Uruchom odliczanie';
  static const String waitForTimers = 'Oczekiwanie na minutniki';

  // Planner screen
  static const String generatePlanner = 'Losuj posiłki';
  static const String createShopList = 'Dodaj do listy zakupów';
  static const String planNewDish = 'Zaplanuj nowy posiłek';
}
