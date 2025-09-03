# 🚀 Quick Start Guide

## Installation (30 seconds)

```bash
# Option 1: If you have the files
bash install.sh

# Option 2: Direct download (when published)
curl -L https://github.com/YOUR_USERNAME/claude-checkpoint/archive/main.zip -o checkpoint.zip
unzip checkpoint.zip
cd claude-checkpoint-main
bash install.sh
```

## First Commands to Try

```bash
# 1. Check it's working
./claude-checkpoint.sh status

# 2. Create your first checkpoint
./claude-checkpoint.sh quick

# 3. See your checkpoints
./claude-checkpoint.sh list

# 4. Get help
./claude-checkpoint.sh help
```

## Tell Claude to Use It

When starting a Claude Code session, say:
```
"Please use the checkpoint system. Run ./claude-checkpoint.sh save 'description' after each major change"
```

## Emergency Recovery

If something breaks:
```bash
# See recent checkpoints
./claude-checkpoint.sh list

# Restore to a working state
./claude-checkpoint.sh restore <hash-from-list>
```

That's it! You're protected! 🛡️