Feature: Toggle deferred

  Scenario: Attempting to defer test outside buster-mode
    When I insert:
    """
    buster.testCase('Building Page', {
      "contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I go to the front of the word "assert"
    And I press "C-c C-b td"
    Then I should not see "// contains"

  Scenario: Deferring a test
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
    And I press "C-c C-b td"
    Then I should see "// contains"
    And the cursor should be before "assert"

  Scenario: Undeferring a test
    When I insert:
    """
    buster.testCase('Building Page', {
      "// contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I turn on buster-mode
    And I go to the front of the word "assert"
    And I press "C-c C-b td"
    Then I should not see "// contains"

  Scenario: Deferring a single quoted test
    When I insert:
    """
    buster.testCase('Building Page', {
      'contains title after loading page': function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I turn on buster-mode
    And I go to the front of the word "assert"
    And I press "C-c C-b td"
    Then I should see "'// contains"
