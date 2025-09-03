# Example Use Cases

## 1. Working with Claude on a New Feature

```bash
# Start fresh branch for Claude
./claude-checkpoint.sh branch ai-feature

# Tell Claude:
"Please implement user authentication and checkpoint after each component"

# Claude will work and you can track progress
./claude-checkpoint.sh list

# If Claude makes a mistake
./claude-checkpoint.sh restore <last-good-hash>
```

## 2. Experimenting with Risky Changes

```bash
# Create backup before experiments
./claude-checkpoint.sh backup

# Create experimental branch
./claude-checkpoint.sh branch experimental

# Let Claude try risky refactoring
# ... Claude works ...

# If it fails, just switch back
git checkout main
git branch -D experimental
```

## 3. Daily Development Workflow

```bash
# Morning: Check status
./claude-checkpoint.sh status

# Before lunch: Quick save
./claude-checkpoint.sh quick

# After completing feature
./claude-checkpoint.sh save "Completed shopping cart feature"

# End of day: Push to GitHub
./claude-checkpoint.sh push
```

## 4. Recovering from Broken State

```bash
# Oh no! Something's broken
./claude-checkpoint.sh list 10

# Find last working checkpoint
./claude-checkpoint.sh diff

# Restore to working state
./claude-checkpoint.sh restore abc1234

# Or create recovery branch
git checkout -b recovery-attempt
```

## 5. Team Collaboration

```bash
# Create feature branch
./claude-checkpoint.sh branch feature/user-auth

# Work with Claude
./claude-checkpoint.sh save "Added login form"
./claude-checkpoint.sh save "Added JWT tokens"

# Push for review
./claude-checkpoint.sh push

# Create PR on GitHub
# Team reviews Claude's work
```

## 6. Large Refactoring

```bash
# Tag current stable version
./claude-checkpoint.sh tag pre-refactor

# Create refactor branch
./claude-checkpoint.sh branch major-refactor

# Checkpoint frequently during refactor
./claude-checkpoint.sh save "Refactored database layer"
./claude-checkpoint.sh save "Updated API endpoints"
./claude-checkpoint.sh save "Migrated frontend components"

# If refactor fails at any point
git checkout main
git checkout pre-refactor
```