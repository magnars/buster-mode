Feature: Toggle focus rocket

  Scenario: Focus test
    When I insert:
    """
    buster.testCase('Building Page', {
      "contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I turn on buster-mode
    And I go to the front of the word "assert"
    And I press "C-c C-b tf"
    Then I should see "=> contains"

  Scenario: Blur test
    When I insert:
    """
    buster.testCase('Building Page', {
      "=> contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I turn on buster-mode
    And I go to the front of the word "assert"
    And I press "C-c C-b tf"
    Then I should not see "=> contains"

  Scenario: Blur test even when user hasn't added a space at the end
    When I insert:
    """
    buster.testCase('Building Page', {
      "=>contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I turn on buster-mode
    And I go to the front of the word "assert"
    And I press "C-c C-b tf"
    Then I should not see "=>contains"
