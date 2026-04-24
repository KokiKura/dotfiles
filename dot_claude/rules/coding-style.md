---
name: Python Coding Standards
description: Python development coding style and conventions for all projects
type: feedback
---

# Python Coding Standards

## Comments & Documentation
- **All comments must be in English** — No Japanese comments in code
- Use single-line comments for explanations
- Use docstrings for modules, classes, and functions (one-line format preferred)
- Keep comments concise and focus on WHY, not WHAT
- **Function docstrings must describe WHAT the function does** — Write in concise, present-tense English (e.g., "Load quiz questions", not "Loading..." or "Loads...")

## Naming Conventions
- **Variables & Functions**: `snake_case` (lowercase with underscores)
- **Classes**: `PascalCase` (capitalize each word)
- **Constants**: `UPPER_SNAKE_CASE`
- **Private attributes**: prefix with `_` (e.g., `_internal_state`)

## Type Hints
- **Required for all functions** — Specify parameter and return types
- Use `Optional[T]` for nullable values, not `T | None` for Python 3.9 compatibility
- Use `List[T]`, `Dict[K, V]` from `typing` module

Example:
```python
def load_questions(limit: int = 10) -> List[Dict]:
    """Load quiz questions up to the specified limit."""
```

## Code Structure
- **Maximum line length**: 100 characters
- **Maximum function length**: 50 lines (break into smaller functions)
- **File organization**:
  1. Imports (stdlib, third-party, local)
  2. Module docstring
  3. Constants
  4. Classes
  5. Functions

## Error Handling
- Use specific exception types, not bare `except:`
- Raise meaningful exceptions with descriptive messages
- Don't catch exceptions you can't handle

```python
# Good
try:
    load_data()
except FileNotFoundError as e:
    logger.error(f"Config file not found: {e}")
    raise

# Bad
try:
    load_data()
except:
    pass
```

## Imports
- Organize in this order: stdlib → third-party → local
- Use `from x import y` for clarity
- Avoid wildcard imports (`from module import *`)

```python
# Good
from typing import List, Optional
from datetime import datetime
from mymodule import helper
```

## Testing
- Test file naming: `test_*.py` or `*_test.py`
- Use descriptive test names: `test_load_questions_returns_valid_data()`
- Avoid mocking internal dependencies; test with real data when possible

## Miscellaneous
- No commented-out code — delete unused code instead
- Avoid magic numbers — use named constants
- Keep functions pure when possible
- Use list comprehensions over loops for readability

```python
# Good
filtered = [q for q in questions if q["level"] == "easy"]

# Avoid
filtered = []
for q in questions:
    if q["level"] == "easy":
        filtered.append(q)
```
