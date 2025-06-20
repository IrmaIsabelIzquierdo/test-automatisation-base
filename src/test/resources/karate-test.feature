Feature: Test de API súper simple

  Background:
    * configure ssl = true

  Scenario: Verificar que un endpoint público responde 200
    Given url 'https://httpbin.org/get'
    When method get
    Then status 200

  Scenario: ConsultaTodosParticipantes
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method GET
    Then status 200


  Scenario: CreaPersonaje
    * header content-type = 'application/json'
    * def queryJSON = read('classpath:../data/CreaPersonaje.json')
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request queryJSON
    When method POST
    Then status 200
    And print response


  Scenario: EliminarPersonaje
  Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/1'
   * print response
  When method DELETE
  Then  status 204

    Scenario: ActualizaPersonaje
    * header content-type = 'application/json'
    * def queryActualizaJSON = read('classpath:../data/ActualizaPersonaje.json')
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/1'
    And request queryActualizaJSON
    When method PUT
    Then  status 200
    * print response

