Question.create(
  biz_id: "foo-bar-qix",
  level: "easy",
  available_at: DateTime.strptime("03/13/2018 8:00", "%m/%d/%Y %H:%M"),
  description: "
    <p>Ecrire une&nbsp;<strong><i>fonction f(x)&nbsp;</i></strong>qui retourne:</p>
      <ul>
        <li>&quot;foo&quot; si x est divisible par 3,</li>
        <li>&quot;bar&quot; si x est divisible par 5,</li>
        <li>&quot;qix&quot; si x est divisible par 3 et 5,</li>
        <li>&quot;zzz&quot; dans tous les autres cas de figure.</li>
      </ul>
  ",
  tests: '{
    "tests":[
      {
        "test_function":"f(3)",
        "test_expectation":"\"foo\""
      },
      {
        "test_function":"f(111)",
        "test_expectation":"\"foo\""
      },
      {
        "test_function":"f(5)",
        "test_expectation":"\"bar\""
      },
      {
        "test_function":"f(115)",
        "test_expectation":"\"bar\""
      },
      {
        "test_function":"f(15)",
        "test_expectation":"\"qix\""
      },
      {
        "test_function":"f(3045)",
        "test_expectation":"\"qix\""
      },
      {
        "test_function":"f(97)",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f()",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f(2.2)",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f(\"3\")",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f(false)",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f(true)",
        "test_expectation":"\"zzz\""
      },
      {
        "test_function":"f(new Date())",
        "test_expectation":"\"zzz\""
      }
    ]
  }',
  initial: '/* global _, $ */

function f(x) {
  //Complétez la fonction f ici
  
}'

)




Question.create(
  biz_id: "anagram-palindrom",
  level: "hard",
  available_at: DateTime.strptime("03/13/2018 8:00", "%m/%d/%Y %H:%M"),
  description: "
    <p>Ecrire une&nbsp;<strong><i>fonction f</i></strong>&nbsp;qui retourne true si le&nbsp;param&egrave;tre a (au moins) un anagramme qui est un palindrome. Seule les majuscules, sans espace ni accent, sont autoris&eacute;es. Par exemple&nbsp;:</p>
      <ul>
        <li>f(&quot;AAB&quot;) renvoie <strong>true</strong> car un anagramme de AAB est un palindrome (il s&#39;agit de &quot;ABA&quot;).</li>
        <li>f(&quot;ABC&quot;) renvoie <strong>false</strong> car aucun anagramme de ABC n&#39;est un palindrome.</li>
        <li>f(&quot;aab&quot;) renvoie <strong>false</strong> car seule les majuscules sont autoris&eacute;es en entr&eacute;e.</li>
      </ul>",
  tests: '{
    "tests": [
      {
        "test_function": "f(\"AAB\")",
        "test_expectation": "true"
      },
      {
        "test_function": "f(\"RESRESASS\")",
        "test_expectation": "true"
      },
      {
        "test_function": "f(\"KAYAK\")",
        "test_expectation": "true"
      },
      {
        "test_function": "f(\"TGTAGA\")",
        "test_expectation": "true"
      },
      {
        "test_function": "f(\"ABC\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f(\"ÂBÂ\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f(\"AB BA\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f(\"KAYAKE\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f(\"aab\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f(\"\")",
        "test_expectation": "false"
      },
      {
        "test_function": "f()",
        "test_expectation": "false"
      },
      {
        "test_function": "f(new Date())",
        "test_expectation": "false"
      }
    ]
  }',
  initial: '/* global _, $ */

function f(x) {
  //Complétez la fonction f ici
  
}'
)
