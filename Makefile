# Simple Makefile for dot-agents template
# Default target: output template files in order

.PHONY: all

all:
	@cat template/HEADER.md template/AGENT_TEMPLATE.md template/FOOTER.md