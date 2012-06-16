Feature: Run all tests

  Scenario: Opens a buffer with test results
    When I turn on buster-mode
    And I press "C-c C-b ra"
    And I switch to buffer "*buster-test*"
    Then I should see "0 timeouts"
