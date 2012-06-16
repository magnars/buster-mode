Feature: Toggle deferred
  In order to quickly defer a test
  As a buster using emacs user
  I want to just press key please

  Scenario: Deferring a test
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
    Then I should see "//contains"

  Scenario: Undeferring a test
    When I insert:
    """
    buster.testCase('Building Page', {
      "//contains title after loading page": function () {
        assert.match(document.body.innerHTML, "Zombie TDD");
      }
    });
    """
    And I go to the front of the word "assert"
    And I press "C-c C-b td"
    Then I should not see "//contains"
