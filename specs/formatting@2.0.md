# Formatting Specification v2.0

## Overview

This specification defines consistent formatting, style, and documentation standards.

## Markdown Standards

### Document Structure
- Use hierarchical headings (H1 for root heading - one per document, H2 for major sections, H3 for subsections, etc.)
- Use consistent spacing: one blank line between sections, two before major headings

### Code Blocks
- Use fenced code blocks with language specification
- Default language: `text` (can be overridden by agents)
- Include line numbers for code examples longer than 10 lines
- Use syntax highlighting appropriate to the content

#### Example
```python
def example_function():
    """Example with proper formatting."""
    return "formatted code"
```

### Lists and Bullets
- Use `-` for unordered lists
- Use `1.` for ordered lists
- Indent nested items with 2 spaces
- Include descriptions for complex list items

### Links and References
- Use descriptive link text (avoid "click here")
- Include alt text for images
- Reference external documents with version numbers when applicable

## Code Style Guidelines

### General Principles
- Follow language-specific conventions (PEP 8 for Python, etc.)
- Use meaningful variable and function names
- Include appropriate comments and docstrings
- Maintain consistent indentation (2 spaces for YAML, 4 for Python)

### Documentation Comments
- Start functions with docstrings describing purpose, parameters, and return values
- Use inline comments for complex logic only
- Keep comments current with code changes
- Inline tags `TODO`` and `FIXME` are permitted for future work notes, where applicable

### Error Messages
- Use clear, actionable error messages
- Provide suggestions for resolution when possible

## Agent Response Formatting

### Standard Response Structure
1. **Summary**: Brief overview of the response
2. **Details**: Comprehensive information
3. **Actions**: Specific recommended actions (if applicable)
4. **References**: Links to relevant documentation or resources

### Severity Indicators
Use consistent formatting for different severity levels:
- ⛔️ **Critical**: Issues requiring immediate attention
- ⚠️ **Warning**: Issues requiring attention but not blocking
- 👉 **Advisory**: Suggestions for improvement
- ℹ️ **Info**: Informational content
- 🔒 **Security**: Security-related concerns

### Code Review Comments
- Use suggestion blocks for specific code changes
- Include rationale for recommendations
- Reference relevant style guides or best practices
- Use consistent formatting for different types of feedback

## File and Directory Naming

### General Rules
- Use lowercase with hyphens for directory names, i.e. `kebab-case`
- Use descriptive names that indicate purpose
- Use `.md` extension for documentation, `.yaml` for schemas

### Agent Files
- Agent directories: `kebab-case` (e.g., `se-automation`)
- Agent definition files: `agent.md`
- Supporting files: descriptive names with appropriate extensions

## Version Control Messages

### Commit Messages

Write a commit message where the first line is a concise summary (50 characters or less), followed by a blank line, and then a more detailed explanation if necessary (for trivial, minor or small changes a single line is usually enough). Use the below format for the summary line:

Format: `type(scope?): description` // scope is optional

Types:
- `feat`: New feature or capability
- `fix`: Bug fix or correction
- `docs`: Documentation changes
- `style`: Formatting or style changes
- `refactor`: Code restructuring without functional changes
- `test`: Test additions or modifications

### Examples
- `feat(agents): add data-research agent definition`
- `fix(specs): correct io-protocol schema validation`
- `docs(readme): update repository structure documentation`
- `docs: fixing typos in multiple files`

## Validation Rules

### Required Elements
All agent responses must include:
- Proper markdown formatting
- Consistent heading structure
- Code blocks with language specification
- Error handling according to io-protocol standards

### Quality Checks
- No trailing whitespace
- Consistent line endings (LF)
- Valid markdown syntax
- Spell-checked content (excluding code and technical terms)

## Customization Points

Agents may override the following formatting defaults:
- `code_blocks.language_default`: Default programming language
- `severity_indicators.style`: Emoji vs text indicators
- `response_structure.order`: Order of response sections
- `link_style.preference`: Inline vs reference links

## Version Information
- Version: 2.0
- Compatibility: Required for all agents
- Override level: Low priority (agents may customize within guidelines)
