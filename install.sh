#!/bin/bash

# Claude Code Checkpoint System - Universal Setup Script
# Version: 2.0
# This script sets up the checkpoint system in any project

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Claude Code Checkpoint System - Setup${NC}"
echo "=========================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}📁 Initializing git repository...${NC}"
    git init
    echo -e "${GREEN}✅ Git initialized${NC}"
else
    echo -e "${GREEN}✅ Git repository detected${NC}"
fi

# Copy the main checkpoint script
echo -e "${BLUE}📋 Installing checkpoint script...${NC}"
if [ -f "$SCRIPT_DIR/claude-checkpoint.sh" ]; then
    cp "$SCRIPT_DIR/claude-checkpoint.sh" ./claude-checkpoint.sh
    chmod +x ./claude-checkpoint.sh
    echo -e "${GREEN}✅ Checkpoint script installed${NC}"
else
    echo -e "${RED}❌ Error: claude-checkpoint.sh not found in $SCRIPT_DIR${NC}"
    exit 1
fi
# Setup git hooks
echo -e "${BLUE}🔧 Setting up git hooks...${NC}"
mkdir -p .git/hooks

if [ -f "$SCRIPT_DIR/pre-commit-hook" ]; then
    cp "$SCRIPT_DIR/pre-commit-hook" ./.git/hooks/pre-commit
    chmod +x ./.git/hooks/pre-commit
    echo -e "${GREEN}✅ Pre-commit hook installed${NC}"
else
    echo -e "${YELLOW}⚠️  Warning: pre-commit-hook not found, skipping${NC}"
fi

# Copy documentation files
echo -e "${BLUE}📚 Installing documentation...${NC}"

if [ -f "$SCRIPT_DIR/CLAUDE_INSTRUCTIONS.md" ]; then
    cp "$SCRIPT_DIR/CLAUDE_INSTRUCTIONS.md" ./
    echo -e "${GREEN}✅ Claude instructions installed${NC}"
fi

if [ -f "$SCRIPT_DIR/README_CHECKPOINT.md" ]; then
    cp "$SCRIPT_DIR/README_CHECKPOINT.md" ./
    echo -e "${GREEN}✅ Checkpoint readme installed${NC}"
fi

# Create initial checkpoint
echo ""
echo -e "${BLUE}📸 Creating initial checkpoint...${NC}"
if ./claude-checkpoint.sh save "Initial checkpoint system setup" 2>/dev/null; then
    echo -e "${GREEN}✅ Initial checkpoint created${NC}"
else
    echo -e "${YELLOW}ℹ️  No changes to checkpoint (system may already be set up)${NC}"
fi

echo ""
echo "=========================================="
echo -e "${GREEN}✅ Claude Checkpoint System Ready!${NC}"
echo "=========================================="
echo ""
echo "Quick commands:"
echo "  ./claude-checkpoint.sh quick    - Quick checkpoint"
echo "  ./claude-checkpoint.sh status   - Check status"
echo "  ./claude-checkpoint.sh list     - List checkpoints"
echo "  ./claude-checkpoint.sh help     - Show all commands"
echo ""
echo "For GitHub integration:"
echo "  git remote add origin <your-repo-url>"
echo "  ./claude-checkpoint.sh push"
echo ""