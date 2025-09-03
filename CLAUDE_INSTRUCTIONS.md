# Claude Code Agent Instructions

## Checkpoint Guidelines

When working on this project, please follow these checkpoint practices:

### 1. Automatic Checkpointing
Create a git commit checkpoint after:
- Completing each major function or component
- Adding new features
- Fixing bugs
- Making significant refactors
- Before any potentially breaking changes

### 2. Commit Message Format
```
[CLAUDE-CHECKPOINT] <Type>: <Description>

Types:
- Feature: New feature implementation
- Fix: Bug fixes
- Refactor: Code improvements
- Update: Dependency or configuration updates
- Test: Test additions or modifications
- Docs: Documentation changes
```

### 3. Branch Strategy
- Work in feature branches: `claude/<feature-name>`
- Never directly modify the `main` or `master` branch
- Create experimental branches for risky changes

### 4. Quick Commands
```bash
# Quick save current work
./claude-checkpoint.sh quick

# Save with message
./claude-checkpoint.sh save "Completed user authentication"

# Check status
./claude-checkpoint.sh status

# Create working branch
./claude-checkpoint.sh branch feature-name
```

### 5. Before Major Changes
1. Create a checkpoint: `./claude-checkpoint.sh save "Before major refactor"`
2. Consider creating a new branch
3. Run tests if available

### Emergency Recovery
If something goes wrong:
1. List checkpoints: `./claude-checkpoint.sh list`
2. Review changes: `./claude-checkpoint.sh diff`
3. Restore if needed: `./claude-checkpoint.sh restore <hash>`

Remember: Every checkpoint is a safety net. Use them liberally!
