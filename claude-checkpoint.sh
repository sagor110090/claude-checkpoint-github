#!/bin/bash

# Claude Code Checkpoint Management System
# For: /Users/sagor/Code/image-app
# Purpose: Manage git checkpoints for Claude Code agent work

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display help
show_help() {
    echo "Claude Code Checkpoint Management System"
    echo "========================================="
    echo ""
    echo "Usage: ./claude-checkpoint.sh <command> [options]"
    echo ""
    echo "Commands:"
    echo "  save [message]     - Create a new checkpoint with optional message"
    echo "  quick              - Quick checkpoint with timestamp"
    echo "  list [n]           - List last n checkpoints (default: 10)"
    echo "  restore <hash>     - Restore to a specific checkpoint"
    echo "  branch <name>      - Create a new branch for Claude to work on"
    echo "  tag <name>         - Tag current state as a milestone"
    echo "  status             - Show current git status and branch"
    echo "  diff               - Show changes since last checkpoint"
    echo "  push               - Push all checkpoints to GitHub"
    echo "  backup             - Create a full backup branch"
    echo "  clean              - Interactive cleanup of old checkpoints"
    echo ""
}

# Function to create timestamp
get_timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

# Main logic
case "$1" in
    "save")
        message="${2:-Claude checkpoint at $(get_timestamp)}"
        echo -e "${BLUE}Creating checkpoint...${NC}"
        git add .
        git commit -m "[CLAUDE-CHECKPOINT] $message"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Checkpoint saved: $message${NC}"
            git log --oneline -1
        else
            echo -e "${YELLOW}No changes to checkpoint${NC}"
        fi
        ;;
    
    "quick")
        echo -e "${BLUE}Creating quick checkpoint...${NC}"
        git add .
        git commit -m "[CLAUDE-CHECKPOINT] Quick save - $(get_timestamp)"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Quick checkpoint created${NC}"
            git log --oneline -1
        else
            echo -e "${YELLOW}No changes to checkpoint${NC}"
        fi
        ;;
    
    "list")
        count="${2:-10}"
        echo -e "${BLUE}Last $count Claude checkpoints:${NC}"
        echo "=================================="
        git log --oneline --grep="CLAUDE-CHECKPOINT" -$count --color=always
        echo ""
        echo -e "${BLUE}Available tags:${NC}"
        git tag -l "claude-*"
        ;;
    
    "restore")
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please provide a commit hash${NC}"
            echo "Usage: ./claude-checkpoint.sh restore <commit-hash>"
            echo ""
            echo "Recent checkpoints:"
            git log --oneline --grep="CLAUDE-CHECKPOINT" -5
            exit 1
        fi
        echo -e "${YELLOW}Warning: This will create a new branch from checkpoint $2${NC}"
        read -p "Continue? (y/n): " confirm
        if [ "$confirm" = "y" ]; then
            branch_name="restore-$(date +%s)"
            git checkout -b "$branch_name" "$2"
            echo -e "${GREEN}✓ Restored to checkpoint $2 in branch: $branch_name${NC}"
        else
            echo "Restore cancelled"
        fi
        ;;
    
    "branch")
        name="${2:-claude-work-$(date +%s)}"
        echo -e "${BLUE}Creating new branch for Claude: $name${NC}"
        git checkout -b "$name"
        echo -e "${GREEN}✓ Created and switched to branch: $name${NC}"
        echo "Claude can now work safely in this branch"
        ;;
    
    "tag")
        tag_name="${2:-claude-milestone-$(date +%s)}"
        echo -e "${BLUE}Creating tag: $tag_name${NC}"
        git tag -a "$tag_name" -m "Claude milestone: $tag_name at $(get_timestamp)"
        echo -e "${GREEN}✓ Tagged current state as: $tag_name${NC}"
        ;;
    
    "status")
        echo -e "${BLUE}Current Status:${NC}"
        echo "================"
        echo -e "Branch: ${GREEN}$(git branch --show-current)${NC}"
        echo -e "Last commit: $(git log --oneline -1)"
        echo ""
        echo -e "${BLUE}Working directory status:${NC}"
        git status --short
        ;;
    
    "diff")
        echo -e "${BLUE}Changes since last checkpoint:${NC}"
        echo "================================"
        last_checkpoint=$(git log --grep="CLAUDE-CHECKPOINT" --format="%H" -1)
        if [ -n "$last_checkpoint" ]; then
            git diff --stat $last_checkpoint
            echo ""
            echo -e "${YELLOW}For detailed diff, run: git diff $last_checkpoint${NC}"
        else
            echo "No Claude checkpoints found"
        fi
        ;;
    
    "push")
        echo -e "${BLUE}Pushing to GitHub...${NC}"
        current_branch=$(git branch --show-current)
        git push origin $current_branch
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Pushed branch '$current_branch' to GitHub${NC}"
        fi
        git push origin --tags
        echo -e "${GREEN}✓ All tags pushed${NC}"
        ;;
    
    "backup")
        backup_branch="backup-$(date +%Y%m%d-%H%M%S)"
        echo -e "${BLUE}Creating backup branch: $backup_branch${NC}"
        current_branch=$(git branch --show-current)
        git checkout -b $backup_branch
        git push origin $backup_branch
        git checkout $current_branch
        echo -e "${GREEN}✓ Backup created and pushed as: $backup_branch${NC}"
        ;;
    
    "clean")
        echo -e "${YELLOW}This will help you interactively clean old checkpoints${NC}"
        echo "Showing branches that can be deleted:"
        git branch | grep -E "(claude|restore|backup)-" | while read branch; do
            echo "  $branch - Last commit: $(git log $branch --oneline -1)"
        done
        echo ""
        echo -e "${YELLOW}To delete a branch, use: git branch -d <branch-name>${NC}"
        echo -e "${YELLOW}To force delete: git branch -D <branch-name>${NC}"
        ;;
    
    "help"|"-h"|"--help")
        show_help
        ;;
    
    *)
        if [ -z "$1" ]; then
            show_help
        else
            echo -e "${RED}Unknown command: $1${NC}"
            echo ""
            show_help
        fi
        ;;
esac
