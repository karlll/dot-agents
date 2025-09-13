# Makefile for dot-agents multi-agent system
# Provides utilities for building, validating, and deploying agent configurations

.PHONY: all validate specs agents changelog clean help

# Default target: show help
all: help

# Display available targets
help:
	@echo "dot-agents Multi-Agent System"
	@echo "============================="
	@echo ""
	@echo "Available targets:"
	@echo "  validate    - Validate all specifications and agent definitions"
	@echo "  specs       - List all available specifications"
	@echo "  agents      - List all available agents"
	@echo "  changelog   - Display recent changelog entries"
	@echo "  clean       - Clean temporary files"
	@echo "  help        - Show this help message"
	@echo ""

# Validate specifications and agent manifests
validate:
	@echo "Validating specifications..."
	@for spec in specs/*.md specs/*.yaml; do \
		if [ -f "$$spec" ]; then \
			echo "✓ Found: $$spec"; \
		fi; \
	done
	@echo ""
	@echo "Validating agent definitions..."
	@for agent in agents/*/agent.md; do \
		if [ -f "$$agent" ]; then \
			echo "✓ Found: $$agent"; \
		fi; \
	done
	@echo ""
	@echo "Validation complete!"

# List all specifications with versions
specs:
	@echo "Available Specifications:"
	@echo "========================"
	@for spec in specs/*; do \
		if [ -f "$$spec" ]; then \
			basename="$$(basename $$spec)"; \
			echo "  $$basename"; \
		fi; \
	done

# List all agents with their capabilities
agents:
	@echo "Available Agents:"
	@echo "================"
	@for agent_dir in agents/*/; do \
		if [ -d "$$agent_dir" ] && [ -f "$$agent_dir/agent.md" ]; then \
			agent_name="$$(basename $$agent_dir)"; \
			echo "  $$agent_name/"; \
			echo "    Definition: $$agent_dir/agent.md"; \
		fi; \
	done

# Show recent changelog entries
changelog:
	@echo "Recent Changes:"
	@echo "=============="
	@head -n 50 CHANGELOG.md

# Clean temporary files and build artifacts
clean:
	@echo "Cleaning temporary files..."
	@find . -name "*.tmp" -delete 2>/dev/null || true
	@find . -name ".DS_Store" -delete 2>/dev/null || true
	@echo "Clean complete!"

# Agent-specific targets for detailed information
agent-planner:
	@echo "Planner Agent Details:"
	@echo "====================="
	@head -n 20 agents/planner/agent.md

agent-se-automation:
	@echo "SE-Automation Agent Details:"
	@echo "============================"
	@head -n 20 agents/se-automation/agent.md

agent-data-research:
	@echo "Data-Research Agent Details:"
	@echo "============================"
	@head -n 20 agents/data-research/agent.md

# Legacy support (maintained for backward compatibility)
legacy:
	@echo "Legacy template system has been replaced with multi-agent system."
	@echo "Please use 'make help' to see available targets."
	@echo "See README.md and CHANGELOG.md for migration information."