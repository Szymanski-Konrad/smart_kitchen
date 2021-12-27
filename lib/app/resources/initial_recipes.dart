import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';
import 'package:uuid/uuid.dart';

abstract class InitialRecipes {
  static Recipe plackiTwarogowe() {
    final uuid = const Uuid().v4();

    final ingredients = <Ingredient>[
      Ingredient.withId(recipeId: uuid, name: 'twaróg', unit: 'g', amount: 250),
      Ingredient.withId(
        recipeId: uuid,
        name: 'jajka',
        unit: 'sztuki',
        amount: 3,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'cukier wanilinowy',
        unit: 'łyżka',
        amount: 1,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'jabłko',
        unit: 'sztuka',
        amount: 1,
      ),
      Ingredient.withId(recipeId: uuid, name: 'mąka', unit: 'łyżki', amount: 3),
      Ingredient.withId(
        recipeId: uuid,
        name: 'cynamon',
        unit: 'łyżeczka',
        amount: 0.5,
      ),
    ];

    final steps = [
      RecipeStep.withId(
        recipeId: uuid,
        timers: {const Uuid().v1(): 3},
        content:
            'Do miski włożyć twaróg, dodać żółtka (białka zachować) oraz cukier wanilinowy, następnie rozgnieść praską. ',
        ingredients: [
          ingredients[0].id,
          ingredients[1].id,
          ingredients[2].id,
          ingredients[3].id
        ],
      ),
      RecipeStep.withId(
        recipeId: uuid,
        timers: {const Uuid().v1(): 2},
        content:
            'Jabłko obrać i zetrzeć na tarce o większych oczkach, dodać do twarogu i wymieszać. Następnie dodać mąkę i ponownie dokładnie wymieszać.',
      ),
      RecipeStep.withId(
        recipeId: uuid,
        timers: {const Uuid().v1(): 5},
        content:
            'Białka ubić na sztywną pianę z dodatkiem cukru pudru. Dodać do masy twarogowej i połączyć składniki delikatnie mieszając łyżką.',
      ),
      RecipeStep.withId(
        recipeId: uuid,
        timers: {const Uuid().v1(): 10},
        content:
            'Nakładać porcje ciasta (po ok. 2 łyżki) na rozgrzaną patelnię (np. teflonową, naleśnikową) i rozprowadzić je po powierzchni formując kształtnego placka. Można smażyć na suchej patelni lub z dodatkiem oleju.',
      ),
      RecipeStep.withId(
        recipeId: uuid,
        timers: {const Uuid().v1(): 65},
        content:
            'Zmniejszyć ogień i smażyć przez ok. 2 - 3 minuty lub aż od spodu będą delikatnie zrumienione na złoto. Przewrócić na drugą stronę i powtórzyć smażenie przez ok. 2 minuty. Posypać cukrem pudrem i cynamonem, opcjonalnie skropić syropem klonowym.',
      ),
    ];

    final recipe = Recipe(
      id: uuid,
      name: 'placki twarogowe z jabłkiem',
      category: Category.breakfast,
      ingredients: ingredients,
      steps: steps,
      userId: '',
    );

    return recipe;
  }

  static Recipe bananaCoctail() {
    final uuid = const Uuid().v4();

    final ingredients = [
      Ingredient.withId(
        recipeId: uuid,
        name: 'banan',
        unit: 'sztuk',
        amount: 1,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'płatki owsiane',
        unit: 'łyżki',
        amount: 3,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'masło orzechowe',
        unit: 'łyżki',
        amount: 1,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'cukier',
        unit: 'łyżeczki',
        amount: 2,
      ),
      Ingredient.withId(
        recipeId: uuid,
        name: 'mleko',
        unit: 'szklanka',
        amount: 1,
      ),
    ];

    final steps = [
      RecipeStep.withId(
        recipeId: uuid,
        content:
            'Składniki (banana, płatki owsiane błyskawiczne, masło orzechowe, cukier i mleko) zmiksować na gładki koktajl w blenderze. Podawać najlepiej od razu po przygotowaniu.',
        ingredients: ingredients.map((e) => e.id).toList(),
      ),
    ];

    final recipe = Recipe(
      id: uuid,
      name: 'koktajl bananowy',
      category: Category.breakfast,
      ingredients: ingredients,
      steps: steps,
      userId: '',
    );

    return recipe;
  }
}

    // //JUSTINFO: Trzeci przepis
    // ingredients = [];
    // recipe = Recipe(name: 'tosty', category: 'Śniadanie');
    // recipeID = await insertRecipe(recipe, database);
    // ingredient = Ingredient(name: 'boczek', unit: 'plastry', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'oliwa', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'masło', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'jajka', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'awokado', unit: 'sztuki', amount: 0.5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'pieczywo', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 8,
    //         content:
    //             'Na patelnię włożyć pokrojony na mniejsze kawałki boczek. Skropić oliwą i smażyć przez ok. 4 minuty z każdej strony na umiarkowanym ogniu, aż się wytopi i zrumieni.',
    //         ingredients: [ingredients[0], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Na drugiej patelni na maśle usmażyć jajecznicę, doprawić solą i pieprzem. ',
    //         ingredients: [ingredients[2], ingredients[3]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content: 'Awokado obrać i pokroić na plasterki.',
    //         ingredients: [ingredients[4]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Pieczywo opiec w tosterze, położyć na talerzu, wyłożyć jajecznicę przekładając awokado i kawałkami boczku.',
    //         ingredients: [ingredients[5]]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Czwarty przepis
    // ingredients = [];
    // recipe = Recipe(name: "chłodnik", category: "Obiad");
    // recipeID = await insertRecipe(recipe, database);

    // ingredient = Ingredient(name: 'ogórki', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'rzodkiewki', unit: 'sztuki', amount: 4);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'sałata', unit: 'liście', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'szczypior', unit: 'łyżki', amount: 3);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'koperek', unit: 'łyżki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'czosnek', unit: 'ząbek', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'kefir', unit: 'ml', amount: 500);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Warzywa umyć i osuszyć. Ogórki obrać ze skórki i zetrzeć na tarce o większych oczkach. Rzodkiewki tak samo zetrzeć. Włożyć do miski.',
    //         ingredients: [ingredients[0], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Dodać drobo poszatkowane liście sałaty, szczypiorek, koperek oraz obrany i przeciśnięty przez praskę lub drobno starty czosnek.',
    //         ingredients: [ingredients[2], ingredients[3], ingredients[4]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Dodać kefir, doprawić solą oraz pieprzem i wymieszać. Schłodzić w lodówce.',
    //         ingredients: [ingredients[5]]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Piąty przepis
    // ingredients = [];
    // recipe = Recipe(
    //     name: "Pieczone udka z ziemniakami, porem i marchewką",
    //     category: "Obiad");
    // recipeID = await insertRecipe(recipe, database);
    // ingredient = Ingredient(name: 'udka kurczaka', unit: 'sztuki', amount: 5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'przyprawa do kurczaka', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'gałązki rozmarynu', unit: 'sztuki ', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'czosnek', unit: 'ząbki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'oliwa', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'cytryna', unit: 'sztuki', amount: 0.5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'marchewki', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ziemniaki', unit: 'sztuki', amount: 4);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'por', unit: 'sztuki', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'masło', unit: 'g', amount: 25);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Udka doprawić solą, pieprzem, natrzeć przeciśniętym przez praskę czosnkiem oraz przyprawą (pamiętając o doprawieniu mięsa również pod skórką).',
    //         ingredients: [ingredients[3], ingredients[0], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 120,
    //         content:
    //             'Wysmarować oliwą i odłożyć do zamarynowania jeśli mamy czas. Ułożyć z zachowaniem odstępów w większej formie lub blaszce do pieczenia.',
    //         ingredients: [ingredients[4]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Na wierzchu każdego udka położyć po pół plasterka cytryny, obłożyć listkami rozmarynu.',
    //         ingredients: [ingredients[0], ingredients[5], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Obrać ziemniaki i pokroić w kostkę. Marchewkę obrać i pokroić na plastry. Odciąć zielone liście pora. Białą i jasnozieloną część pokroić na plastry.',
    //         ingredients: [ingredients[7], ingredients[8], ingredients[9]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Warzywa ułożyć wkoło udek, doprawić je solą i pieprzem. Mięso i warzywa posmarować roztopionym masłem.',
    //         ingredients: [ingredients.last]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 50,
    //         content:
    //             'Wstawić do piekarnika nagrzanego do 200 stopni C i piec przez ok. 50 minut.'),
    //     recipeID,
    //     database);

    // //JUSTINFO: Szósty przepis
    // ingredients = [];
    // recipe = Recipe(name: "Schab w sosie koperkowym", category: "Obiad");
    // recipeID = await insertRecipe(recipe, database);
    // ingredient = Ingredient(name: 'schab bez kości', unit: 'g', amount: 700);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'olej', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'bulion', unit: 'ml', amount: 500);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ząbek czosnku', unit: 'sztuk', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'marchewki', unit: 'sztuki', amount: 0.5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'cebula', unit: 'sztuki', amount: 0.25);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'śmietana 30%', unit: 'szklanka', amount: 0.33);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'mąka pszenna', unit: 'łyżeczka', amount: 1.5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'mąka ziemniaczana', unit: 'łyżeczka', amount: 1.5);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'koperek', unit: 'łyżki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 10,
    //         content:
    //             'Mięso pokroić na grube plastry i rozbić (najlepiej poprosić o wystekowanie jeszcze w sklepie w specjalnej maszynie). Rozgrzać dużą patelnię, rozprowadzić po niej olej, włożyć mięso i na dużym ogniu obsmażać po 5 minut z każdej strony.',
    //         ingredients: [ingredients[0], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'W międzyczasie zagotować bulion w garnku. Włożyć w niego podsmażone mięso (można ułożyć jeden plaster na drugim), doprawić solą (ok. 1/2 łyżeczki) i pieprzem.',
    //         ingredients: [ingredients[2], ingredients[0]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 60,
    //         content:
    //             'Po zagotowaniu przykryć garnek, zmniejszyć ogień i gotować przez ok. 1 godzinę lub nieco krócej, do kruchości mięsa. W połowie czasu dodać obrany ząbek czosnku, obraną i startą marchewkę oraz pokrojoną w kosteczkę cebulę.',
    //         ingredients: [ingredients[3], ingredients[4], ingredients[5]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Do ugotowanego mięsa dodać śmietankę oraz (bezpośrednio przez sitko) mąkę pszennę i ziemniaczaną. Wymieszać delikatnie i zagotować. Dodać posiekany koperek i jeszcze pogotować przez ok. 1 minutę.',
    //         ingredients: [
    //           ingredients[6],
    //           ingredients[7],
    //           ingredients[8],
    //           ingredients[9]
    //         ]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Siódmy przepis
    // ingredients = [];
    // recipe = Recipe(
    //     name: "Makaron zapiekany z cukinią i boczkiem", category: "Kolacja");
    // recipeID = await insertRecipe(recipe, database);
    // ingredient = Ingredient(name: 'makaron', unit: 'g', amount: 250);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'oliwa', unit: 'łyżka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'boczek wędzony', unit: 'g', amount: 200);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'por', unit: 'sztuka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'cukinia', unit: 'sztuka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ząbek czosnku', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'natka pietruszki', unit: 'łyżki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'śmietana 30%', unit: 'ml', amount: 250);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'tary ser', unit: 'łyżki', amount: 3);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Makaron ugotować al dente w osolonej wodzie, odcedzić, włożyć z powrotem do garnka. Piekarnik nagrzać do 190 stopni C (jeśli danie będziemy dodatkowo zapiekać).',
    //         ingredients: [ingredients[0]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Na dużej patelni na oliwie zeszklić pokrojonego pora. Dodać drobno starty czosnek a następnie boczek pokrojony w kostkę.',
    //         ingredients: [ingredients[1], ingredients[3]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 10,
    //         content:
    //             'Smażyć co chwilę mieszając przez ok. 5 minut, następnie dodać pokrojoną w kosteczkę cukinię i smażyć przez kolejne 5 minut.',
    //         ingredients: [ingredients[4]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Dodać posiekaną natkę pietruszki oraz śmietankę. Zagotować, doprawić solą oraz pieprzem. Dodać makaron i wymieszać.',
    //         ingredients: [ingredients[7], ingredients[6]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 10,
    //         content:
    //             'Opcjonalnie danie można dodatkowo zapiec w piekarniku. W tym celu należy je przełożyć do naczynia żaroodpornego lub blaszki. Posypać tartym serem i zapiekać bez przykrycia przez ok. 10 minut.',
    //         ingredients: [ingredients.last]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Jeśli dania nie zapiekamy, możemy posypać je serem już po nałożeniu na talerze.',
    //         ingredients: [ingredients.last]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Ósmy przepis
    // ingredients = [];
    // recipe = Recipe(name: "Chłopski garnek", category: "Kolacja");
    // recipeID = await insertRecipe(recipe, database);
    // ingredient = Ingredient(name: 'kiełbasa', unit: 'g', amount: 300);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'wędzony boczek', unit: 'g', amount: 200);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'oliwa', unit: 'łyżki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'cebula', unit: 'sztuka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'marchewki', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'papryka czerwona', unit: 'sztuki', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'bulion', unit: 'ml', amount: 500);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'biała fasolka', unit: 'puszka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'pomidory rozdrobnione', unit: 'puszka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'natka pietruszki', unit: 'szczypta', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Kiełbasę obrać jeśli jest taka konieczność, następnie pokroić w kostkę. Boczek również pokroić w kostkę.',
    //         ingredients: [ingredients[0], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 7,
    //         content:
    //             'Do szerokiego garnka, najlepiej z grubym dnem, wlać 1 łyżkę oliwy lub oleju. Włożyć boczek i co chwilę mieszając podsmażać na małym ogniu przez ok. 7 minut, aż się wytopi.',
    //         ingredients: [ingredients[2], ingredients[1]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 10,
    //         content:
    //             'Dodać pokrojoną kiełbasę i smażyć razem przez ok. 5 minut, aż składniki zaczną się rumienić. Dodać pokrojoną w kosteczkę cebulę i co chwilę mieszając smażyć przez ok. 5 minut.',
    //         ingredients: [ingredients[0], ingredients[3]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 3,
    //         content:
    //             'Dodać 1 łyżkę oliwy lub oleju, obraną i pokrojoną na plasterki marchewkę oraz pokrojoną w kostkę paprykę i smażyć przez ok. 3 minuty. Pod koniec dodać przyprawy.',
    //         ingredients: [ingredients[2], ingredients[4], ingredients[5]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 10,
    //         content:
    //             'Wlać gorący bulion i zagotować. Gotować przez 5 minut, następnie dodać zawartość puszki z fasolką (fasola z zalewą) i gotować przez kolejne 5 minut.',
    //         ingredients: [ingredients[6], ingredients[7]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         timer: 8,
    //         content:
    //             'Dodać rozdrobnione pomidory z puszki (jeśli są w całości należy je zmiksować razem z zalewą) i gotować przez ok. 5 - 10 minut.',
    //         ingredients: [ingredients[8]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Sprawdzić doprawienie solą, podawać z natką pietruszki i pieczywem.',
    //         ingredients: [ingredients[9]]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Dziewiąty przepis
    // ingredients = [];
    // recipe = Recipe(name: "Sałatka z kurczakiem", category: "Kolacja");
    // recipeID = await insertRecipe(recipe, database);
    // ingredient =
    //     Ingredient(name: 'filety z kurczaka', unit: 'sztuki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ząbek czosnku', unit: 'sztuki', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'mąka ziemniaczana', unit: 'łyżeczki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'oliwa', unit: 'łyżki', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'por', unit: 'sztuka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'kukurydza', unit: 'puszka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ananas', unit: 'puszka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient =
    //     Ingredient(name: 'czerwona fasolka', unit: 'puszka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'ser żółty', unit: 'g', amount: 150);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'sałata', unit: 'sztuka', amount: 1);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'majonez', unit: 'łyżki', amount: 4);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // ingredient = Ingredient(name: 'jogurt', unit: 'łyżka', amount: 2);
    // ingredientId = await insertIngredient(ingredient, recipeID, database);
    // ingredients.add(ingredient.copyWith(id: ingredientId));

    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Filety kurczaka pokroić w kostkę, wymieszać z przeciśniętym przez praskę czosnkiem, doprawić solą, pieprzem oraz wszystkimi przyprawami, na koniec obtoczyć w mące ziemniaczanej.',
    //         ingredients: [ingredients[0], ingredients[1], ingredients[2]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Rozgrzać tłuszcz na patelni, włożyć kurczaka i na większym ogniu obsmażyć z każdej strony na złoty kolor.',
    //         ingredients: [ingredients[3]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Obciąć zielone liście pora. Białą i jasnozieloną część przekroić wzdłuż na pół i dokładnie opłukać. Pokroić na paseczki, włożyć do sitka i przelać wrzącą wodą z czajnika. Odcedzić.',
    //         ingredients: [ingredients[4]]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Fasolkę wyłożyć na sitko i przepłukać bieżącą wodą, odcedzić. Odcedzić i pokroić ananasa oraz odcedzić kukurydzę. Ser żółty zetrzeć na tarce o większych oczkach.',
    //         ingredients: [
    //           ingredients[7],
    //           ingredients[6],
    //           ingredients[5],
    //           ingredients[8]
    //         ]),
    //     recipeID,
    //     database);
    // await insertStep(
    //     RecipeStep.withContent(
    //         content:
    //             'Układać składniki warstwowo w salaterce, pamiętając aby posmarować jedną warstwę majonezem a na nim rozsmarować jogurt lub śmietanę. Na wierzch dać posiekane liście sałaty.',
    //         ingredients: [ingredients[9], ingredients[10], ingredients[11]]),
    //     recipeID,
    //     database);

    // //JUSTINFO: Dodawanie produktów
    // Product product = Product(
    //     barcode: '5900820006501',
    //     name: 'mleko',
    //     price: 2.50,
    //     amount: '250 ml',
    //     kcal: 50,
    //     fat: 2.0,
    //     carbohydrates: 4.8,
    //     protein: 3.3,
    //     salt: 0.1);
    // await database.insert('product', product.toMap());
    // product = Product(
    //     barcode: '5901520000059',
    //     name: 'woda',
    //     price: 1.10,
    //     amount: '1 l',
    //     kcal: 50,
    //     fat: 2.0,
    //     carbohydrates: 4.8,
    //     protein: 3.3,
    //     salt: 0.1);
    // await database.insert('product', product.toMap());
    // product = Product(
    //     barcode: '5901359352039',
    //     name: 'reeds żurawionowy',
    //     price: 2.35,
    //     amount: '500 ml',
    //     kcal: 54,
    //     fat: 0.01,
    //     carbohydrates: 0,
    //     protein: 0,
    //     salt: 0.01);
    // await database.insert('product', product.toMap());
    // product = Product(
    //     barcode: '3435649824934',
    //     name: 'kukurydza',
    //     price: 3.30,
    //     amount: '285 g',
    //     kcal: 80,
    //     fat: 1.9,
    //     carbohydrates: 11,
    //     protein: 3,
    //     salt: 0.4);
    // await database.insert('product', product.toMap());
