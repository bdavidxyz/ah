FactoryBot.define do

  factory :question do 
  
    trait :easy do 
      biz_id "foo-bar-qix",
      level "easy",
      point_max 200
      point_loss 1.5
      point_plateau 120
      available_at DateTime.strptime("03/13/2018 8:00", "%m/%d/%Y %H:%M"),
      description "<p>Ecrire une&nbsp;<strong><i>fonction f(x)&nbsp;</i></strong>qui retourne:</p> <ul> <li>&quot;foo&quot; si x est divisible par 3,</li> <li>&quot;bar&quot; si x est divisible par 5,</li> <li>&quot;qix&quot; si x est divisible par 3 et 5,</li> <li>&quot;zzz&quot; dans tous les autres cas de figure.</li> </ul>",
      tests '{ "tests":[ { "test_function":"f(3)", "test_expectation":"\"foo\"" }, { "test_function":"f(111)", "test_expectation":"\"foo\"" }, { "test_function":"f(5)", "test_expectation":"\"bar\"" }, { "test_function":"f(115)", "test_expectation":"\"bar\"" }, { "test_function":"f(15)", "test_expectation":"\"qix\"" }, { "test_function":"f(3045)", "test_expectation":"\"qix\"" }, { "test_function":"f(97)", "test_expectation":"\"zzz\"" }, { "test_function":"f()", "test_expectation":"\"zzz\"" }, { "test_function":"f(2.2)", "test_expectation":"\"zzz\"" }, { "test_function":"f(\"3\")", "test_expectation":"\"zzz\"" }, { "test_function":"f(false)", "test_expectation":"\"zzz\"" }, { "test_function":"f(true)", "test_expectation":"\"zzz\"" }, { "test_function":"f(new Date())", "test_expectation":"\"zzz\"" } ] }',
      initial '/* global _, $ */ function f(x) { //Complétez la fonction f ici }'
    end
  
    trait :hard do 
      biz_id "anagram-first-last",
      level "hard",
      point_max 1000
      point_loss 1.5
      point_plateau 180
      available_at DateTime.strptime("03/13/2018 9:00", "%m/%d/%Y %H:%M"),
      description "<p>Ecrire une&nbsp;<strong><i>fonction f</i></strong>&nbsp;qui retourne le nombre d'anagrammes distincts qui commencent et terminent par la même lettre. Seule les lettres majuscules, sans espace ni accent, sont autorisées. Par exemple :</p> <ul> <li>f(&quot;AAB&quot;) renvoie <strong>1</strong> (ABA) </li> <li>f(&quot;TATA&quot;) renvoie <strong>2</strong> (ATTA, TAAT) </li> <li>f(&quot;ABC&quot;) renvoie <strong>0</strong> </li> <li>f(&quot;aab&quot;) renvoie <strong>0</strong> car seule les majuscules sont autoris&eacute;es.</li> </ul>",
      tests '{ "tests": [ { "test_function": "f(\"AAB\")", "test_expectation": "1" }, { "test_function": "f(\"TATA\")", "test_expectation": "2" }, { "test_function": "f(\"TATAS\")", "test_expectation": "6" }, { "test_function": "f(\"TATASK\")", "test_expectation": "24" }, { "test_function": "f(\"RR\")", "test_expectation": "1" }, { "test_function": "f(\"R\")", "test_expectation": "1" }, { "test_function": "f(\"ABC\")", "test_expectation": "0" }, { "test_function": "f(\"4242\")", "test_expectation": "0" }, { "test_function": "f(\"\")", "test_expectation": "0" }, { "test_function": "f()", "test_expectation": "0" }, { "test_function": "f(\"aab\")", "test_expectation": "0" }, { "test_function": "f(\"ÂAB\")", "test_expectation": "0" }, { "test_function": "f(new Date())", "test_expectation": "0" } ] }',
      initial '/* global _, $ */ function f(x) { //Complétez la fonction f ici }'
    end

  end

end
