# GLOBAL CODE RULES FOR CLAUDE CODE

## Functions & Methods
- Write short, focused functions and methods, maximum 20 lines, ideal under 15 lines
- Enforce single responsibility: one method, one clear task
- Use descriptive, verb-first names such as calculateTotal, validateInput, fetchUserData
- No side effects; minimize mutable state
- Maximum 3 parameters per function; use objects for more inputs
- Extract smaller functions instead of adding comments
- Early returns preferred over else blocks and nested conditionals

## Structure & Style
- Consistent indentation using 2 or 4 spaces as defined by the project
- Clear separation of concerns: logic, UI, data, utilities
- Avoid deep nesting, maximum 2 levels
- Remove dead code, unused imports, and commented-out blocks
- Consistent naming conventions: camelCase, PascalCase, snake_case based on language
- Constants in UPPER_SNAKE_CASE
- No trailing commas, whitespace
- One blank line between logical sections
- Add trailing new line at the end of all files

## Functional Programming
- Prefer immutability over mutable state
- Use pure functions and avoid side effects
- Leverage map, filter, reduce instead of imperative loops
- Compose small functions instead of large monolithic logic
- Prefer declarative code over imperative code

## Readability & Maintianibility
- Prioritize readability over clever code
- Self-documenting code over excessive comments
- Comments only for explaining why, not what or how
- Use meaningful variable names, preferably ends with a noun for data and a verb for functions
- Do not use unclear names like tmp, data, info or uncommon abbreviations
- Avoid overly complex one-liners; split into readable steps
- Optimize for maintainability first, then performance
- Use native and language-standard methods over custom logic
- DRY: extract repeated code into shared utilities
- No hardcoded magic numbers or strings; use constants
- Write only the minimum code to meet requirements
- No premature abstraction or over-engineering

## Standards & Conventions
- Follow official standards when available, for example RFC3339 for datetime serialization
- Use language-native APIs and standard libraries
- Maintain consistent error types and response structures

## Error Handling & Robustness
- Explicit error handling with try/catch, guards, null checks
- Fail fast with early validation
- Explicit exceptions, never fail silently
- Handle edge cases and empty states
- Practice defensive programming without redundancy

## Testing & Quality
- Write testable code with pure functions and dependency injection
- Small functions make testing easier
- Cover edge cases in test logic
- Follow Arrange/Act/Assert pattern for all tests
- Use clear test names that describe expected behavior

## Version Control
- Follow conventional commits format for all commits
- Use standard prefixes including feat:, fix:, docs:, style:, refactor:, test:, chore:
- Make small, incremental commits
- Ensure every commit compiles and runs successfully

## Interaction & Behavior Rules
- Report to user immediately after 3 consecutive failed attempts
- Ask for clarification if requirements are unclear
