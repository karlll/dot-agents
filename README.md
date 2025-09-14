# dot-agents

Organize agents and their instructions.

## Repository Structure

```
/specs/
  core-architecture@1.0.md     # Shared architectural principles, escalation rules
  io-protocol@1.0.yaml         # Message schemas, input/output contracts
  formatting@1.0.md            # Style rules, markdown/code conventions
  safety@1.0.md                # Refusal policy, sensitive data handling
  governance@1.0.md            # Precedence rules, conflict resolution, update process

/agents/
  planner/agent.md             # <example> Planner agent definition
  se-automation/agent.md       # <example> Software Engineering Automation agent definition
  data-research/agent.md       # <example> Research/knowledge retrieval agent definition

CHANGELOG.md                   # Records version history of specs and agents
README.md                      # This file
```

## Core Concepts

### Shared Specifications (Profiles)
The `/specs/` directory contains versioned profiles that define common behavior patterns:
- **Versioned**: Use semantic versioning (`major.minor`)
- **Single responsibility**: One concern per profile
- **Composable**: Agents can import multiple profiles
- **Hierarchical**: Clear precedence rules prevent conflicts

### Agent Definitions
Each agent in `/agents/` defines:
1. **Manifest Header**: Machine-readable block declaring profile versions and overrides
2. **Purpose & Role**: Clear description of responsibilities and scope
3. **Behavior Rules**: How the agent applies shared profiles to its role
4. **Examples**: Concrete I/O examples using standardized schemas

### Governance and Precedence
Precedence hierarchy (highest to lowest priority):
1. **Safety** - Cannot be overridden by any agent
2. **I/O Protocol** - Ensures consistent communication
3. **Core Architecture** - Fundamental patterns and practices
4. **Formatting** - Style and documentation standards
5. **Agent Overrides** - Role-specific customizations

## Quick Start

### Using the Agents
Each agent follows the same basic pattern:

1. **Check capabilities** in the agent's manifest
2. **Send requests** following the io-protocol schemas
3. **Receive responses** in standardized formats
4. **Handle errors** using the defined error codes

### Example: Planning a Task
```json
{
  "type": "task.plan.v1",
  "version": "1.0",
  "timestamp": "2025-01-15T10:30:00Z",
  "payload": {
    "task_description": "Implement user authentication system",
    "requirements": ["OAuth2 support", "Multi-factor authentication", "Session management"]
  }
}
```

### Example: Code Review
```json
{
  "type": "code.diff.v1", 
  "version": "1.0",
  "timestamp": "2025-01-15T14:20:00Z",
  "payload": {
    "diff_content": "... git diff content ...",
    "file_path": "src/auth.py"
  }
}
```

