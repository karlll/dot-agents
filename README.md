# dot-agents

A modular, versioned multi-agent system that organizes agents and shared rules into a consistent, scalable architecture. The design ensures consistency across agents while allowing specialization and evolution.

## Repository Structure

```
/specs/
  core-architecture@1.0.md     # Shared architectural principles, escalation rules
  io-protocol@1.0.yaml         # Message schemas, input/output contracts
  formatting@1.0.md            # Style rules, markdown/code conventions
  safety@1.0.md                # Refusal policy, sensitive data handling
  governance@1.0.md            # Precedence rules, conflict resolution, update process

/agents/
  planner/agent.md             # Planner agent definition
  se-automation/agent.md       # Software Engineering Automation agent definition
  data-research/agent.md       # Research/knowledge retrieval agent definition

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

## Available Agents

### 🎯 Planner Agent
**Purpose**: Break down complex tasks into manageable, actionable plans
- Analyzes requirements and constraints
- Creates step-by-step execution strategies
- Identifies dependencies and resource needs
- Provides alternative approaches

### 🔧 SE-Automation Agent  
**Purpose**: Automate software engineering workflows and code review
- Automated code quality assessment
- Security vulnerability detection
- Style and convention enforcement
- CI/CD optimization guidance

### 🔍 Data-Research Agent
**Purpose**: Information gathering and knowledge synthesis
- Technical research and analysis
- Best practice identification
- Trend analysis and recommendations
- Evidence-based decision support

## Safety and Security

This system is designed with safety as the highest priority:
- **No Override of Safety Rules**: Safety specifications cannot be modified by agents
- **Human Oversight**: Security decisions require human confirmation
- **Data Protection**: Comprehensive privacy and sensitive data protocols
- **Audit Trails**: All governance decisions and safety events are logged

## Versioning and Updates

### Semantic Versioning
- **Major versions** (X.0): Breaking changes requiring agent updates
- **Minor versions** (X.Y): Backward-compatible improvements

### Update Process
- **Specifications**: Follow formal review and testing process
- **Agents**: Pin to specific profile versions, override minimally
- **Governance**: Automatic conflict resolution with escalation procedures

## Contributing

### For Specification Updates
1. Submit proposals with clear rationale
2. Include migration notes for breaking changes
3. Test compatibility with existing agents
4. Update CHANGELOG.md with affected components

### For New Agents  
1. Follow agent definition template structure
2. Reference appropriate profile versions
3. Minimize overrides and document rationale
4. Include comprehensive examples and integration points

### For Bug Reports
1. Specify affected specifications and versions
2. Include agent configurations and error messages
3. Provide steps to reproduce issues
4. Suggest potential resolutions

## License

[Specify your license here]

## Support

For questions, issues, or contributions, please refer to the governance specification for escalation procedures and contact information.
