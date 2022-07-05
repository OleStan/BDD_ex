Feature: Create Post
  User must have possibility to create posts with different values

  Scenario Outline: User create visible post
    Given publication title "<title>"
    And publication content "<content>"
    When entered all params and check visible checkbox
    Then Any user can see the post

    Examples:
      | title            | content |
      | content          | TGIF    |
      | Sunday           | Nope    |
      | New post         | Nope    |

  Scenario Outline: User create hidden post
    Given publication title "<title>"
    And publication content "<content>"
    When entered all params and don't check visible checkbox
    Then Nobody can see the post

    Examples:
      | title            | content |
      | content          | TGIF    |
      | Sunday           | Nope    |
      | anything else!   | Nope    |
