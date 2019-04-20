Feature: searching to quickly find apps according to name/organization/description
    As a logged in user
    So that I can quickly find the app I'm looking for
    I should be able to search the app in the app listing page by name/organization/description

Background: Logged in
    Given the following apps exist:
        | name   | description             | org_id | status  |
        | app 1  | this is one test        | 1      | pending |
        | app 2  | this is two test        | 2      | pending |
        | app 3  | this is three test      | 3      | pending |

    And the following orgs exist:
        | name  | contact_id |
        | org A | 1          |
        | org B | 1          |
        | org C | 1          |

    And the following users exist:
        | name  | github_uid      | email         |
        | user 1 | esaas_developer | test@user.com |
        | user 2 |                 | test@user.com |
        | user 3 |                 | test@user.com |

    And I'm logged in on the orgs page 

Scenario: search for an app by name keyword
    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "1"
    Then I should see "app 1"
    But I should not see "app 2"
    And I should not see "app 3"
    And I should not see "user 1"

    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "app"
    Then I should see "app 1"
    And I should see "app 2"
    And I should see "app 3"

Scenario: search for an app by organization keyword
    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "B"
    Then I should see "app 2"
    But I should not see "app 1"
    And I should not see "app 3"

    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "org"
    Then I should see "app 1"
    And I should see "app 2"
    And I should see "app 3"

Scenario: search for an app by description keyword
    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "three"
    Then I should see "app 3"
    But I should not see "app 1"
    And I should not see "app 2"

    Given I uncheck "Organization"
    And I uncheck "User"
    And I check "App" 
    And I search for "test"
    Then I should see "app 1"
    And I should see "app 2"
    And I should see "app 3"

Scenario: search for an organization by keyword
    Given I check "Organization"
    And I uncheck "User"
    And I uncheck "App" 
    And I search for "B"
    Then I should see "org A"
    But I should not see "org B"
    And I should not see "org C"

    Given I check "Organization"
    And I uncheck "User"
    And I uncheck "App" 
    And I search for "org"
    Then I should see "org A"
    And I should see "org B"
    And I should see "org C"

Scenario: search for an user by keyword
    Given I uncheck "Organization"
    And I check "User"
    And I uncheck "App" 
    And I search for "2"
    Then I should see "user 2"
    But I should not see "user 1"
    And I should not see "user 3"
    And I should not see "app 2"

    Given I uncheck "Organization"
    And I check "User"
    And I uncheck "App" 
    And I search for "user"
    Then I should see "user 1"
    And I should see "user 2"
    And I should see "user 3"

Scenario: search for all three categories by keyword
    Given I check "Organization"
    And I check "User"
    And I check "App" 
    And I search for "2"
    Then I should see "user 2"
    And I should see "app 2"

