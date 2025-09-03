# 🤖 Claude Code Checkpoint System

A comprehensive Git-based checkpoint system designed for safe collaboration with Claude Code AI agent. Never lose work or break your project again!

## ✨ Features

- **11 Checkpoint Commands**: Quick save, restore, branch, backup, and more
- **Automatic Validation**: Pre-commit hooks for TypeScript, Python, and Node.js projects
- **GitHub Integration**: Push and pull checkpoints seamlessly
- **Branch Management**: Safe experimentation with automatic branching
- **Recovery Options**: Multiple ways to restore if things break
- **Large Project Optimized**: Works efficiently even with 20,000+ files

## 🚀 Quick Installation

### Method 1: Clone and Install (Recommended)
```bash
# Clone this repository
git clone https://github.com/yourusername/claude-checkpoint-system.git
cd claude-checkpoint-system

# Copy install script and files to your project
cp -r * /path/to/your/project/
cd /path/to/your/project

# Run the installer
bash install.sh
```

### Method 2: Direct Copy
```bash
# In your project directory
curl -O https://raw.githubusercontent.com/yourusername/claude-checkpoint-system/main/install.sh
curl -O https://raw.githubusercontent.com/yourusername/claude-checkpoint-system/main/claude-checkpoint.sh
curl -O https://raw.githubusercontent.com/yourusername/claude-checkpoint-system/main/pre-commit-hook

# Make executable and setup
chmod +x install.sh
./install.sh
```

### Method 3: Manual Setup
```bash
# Copy these files to your project:
# 1. claude-checkpoint.sh - Main script
# 2. pre-commit-hook -> .git/hooks/pre-commit
# 3. CLAUDE_INSTRUCTIONS.md (optional)

chmod +x claude-checkpoint.sh
chmod +x .git/hooks/pre-commit
```

## 📋 Available Commands

| Command | Description | Example |
|---------|-------------|---------|
| `quick` | Quick checkpoint with timestamp | `./claude-checkpoint.sh quick` |
| `save [msg]` | Save with description | `./claude-checkpoint.sh save "Added auth"` |
| `list [n]` | List last n checkpoints | `./claude-checkpoint.sh list 20` |
| `status` | Show current status | `./claude-checkpoint.sh status` |
| `diff` | Show uncommitted changes | `./claude-checkpoint.sh diff` |
| `restore <hash>` | Restore to checkpoint | `./claude-checkpoint.sh restore abc123` |
| `branch <name>` | Create working branch | `./claude-checkpoint.sh branch feature` |
| `backup` | Create backup branch | `./claude-checkpoint.sh backup` |
| `tag <name>` | Tag milestone | `./claude-checkpoint.sh tag v1.0` |
| `push` | Push to GitHub | `./claude-checkpoint.sh push` |
| `clean` | Cleanup old branches | `./claude-checkpoint.sh clean` |

## 🎯 Usage with Claude Code

When working with Claude Code AI, instruct it to:

```
"Please checkpoint your work after each major change using ./claude-checkpoint.sh save with a descriptive message"
```

Or more specifically:

```
"Create a new branch with ./claude-checkpoint.sh branch feature-name, 
then checkpoint after completing each function"
```

## 📖 Typical Workflow

```bash
# 1. Start a new feature
./claude-checkpoint.sh branch new-feature

# 2. Let Claude work, checkpoint regularly
./claude-checkpoint.sh save "Implemented user model"
./claude-checkpoint.sh save "Added API endpoints"

# 3. Check status anytime
./claude-checkpoint.sh status
./claude-checkpoint.sh list

# 4. If something breaks, restore
./claude-checkpoint.sh restore <commit-hash>

# 5. When done, push to GitHub
./claude-checkpoint.sh push
```

## 🔧 Project-Specific Features

The system automatically detects and configures for:

- **Node.js/TypeScript**: TypeScript compilation checks, console.log warnings
- **Python**: Syntax validation, PEP8 compliance
- **React Native/Expo**: Expo doctor checks
- **Large Projects**: Optimized for 20,000+ files

## 📁 Repository Contents

```
claude-checkpoint-github/
├── install.sh                 # Universal installer script
├── claude-checkpoint.sh       # Main checkpoint management script
├── pre-commit-hook           # Git pre-commit validation
├── CLAUDE_INSTRUCTIONS.md    # Instructions for Claude AI
├── README.md                 # This file
└── examples/                 # Example usage scenarios
```

## ⚙️ Configuration

### Pre-commit Hook Customization

Edit `.git/hooks/pre-commit` after installation to add project-specific checks:

```bash
# Add custom checks
if [ -f "requirements.txt" ]; then
    echo "Running Python tests..."
    python -m pytest
fi
```

### Exclude Patterns

Add to `.gitignore` to exclude files from checkpoints:

```
node_modules/
*.log
.env
build/
dist/
```

## 🆘 Troubleshooting

### Commands not working?
```bash
# Ensure script is executable
chmod +x claude-checkpoint.sh

# Check git is initialized
git status
```

### Pre-commit hook hanging?
The hook is optimized for large projects but you can disable it:
```bash
mv .git/hooks/pre-commit .git/hooks/pre-commit.disabled
```

### Can't restore checkpoint?
```bash
# List all available checkpoints
git log --oneline --grep="CLAUDE-CHECKPOINT"

# Force restore (careful!)
git reset --hard <commit-hash>
```

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📜 License

MIT License - Use freely in your projects

## 🙏 Credits

Created for safe AI-assisted development with Claude Code by Anthropic.

---

**Remember**: Every checkpoint is a safety net. Use them liberally!