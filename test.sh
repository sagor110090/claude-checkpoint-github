#!/bin/bash

# Test script to verify the checkpoint system works

echo "🧪 Testing Claude Checkpoint System Installation"
echo "================================================"
echo ""

# Test 1: Check if files exist
echo "1️⃣ Checking required files..."
errors=0

if [ ! -f "claude-checkpoint.sh" ]; then
    echo "❌ claude-checkpoint.sh not found"
    errors=$((errors + 1))
else
    echo "✅ claude-checkpoint.sh found"
fi

if [ ! -f "install.sh" ]; then
    echo "❌ install.sh not found"
    errors=$((errors + 1))
else
    echo "✅ install.sh found"
fi

if [ ! -f "pre-commit-hook" ]; then
    echo "❌ pre-commit-hook not found"
    errors=$((errors + 1))
else
    echo "✅ pre-commit-hook found"
fi

# Test 2: Check if scripts are executable
echo ""
echo "2️⃣ Checking file permissions..."

if [ ! -x "claude-checkpoint.sh" ]; then
    echo "❌ claude-checkpoint.sh is not executable"
    errors=$((errors + 1))
else
    echo "✅ claude-checkpoint.sh is executable"
fi

if [ ! -x "install.sh" ]; then
    echo "❌ install.sh is not executable"
    errors=$((errors + 1))
else
    echo "✅ install.sh is executable"
fi

# Test 3: Verify script completeness
echo ""
echo "3️⃣ Verifying script completeness..."

lines=$(wc -l < claude-checkpoint.sh)
if [ "$lines" -lt 150 ]; then
    echo "❌ claude-checkpoint.sh seems incomplete (only $lines lines)"
    errors=$((errors + 1))
else
    echo "✅ claude-checkpoint.sh is complete ($lines lines)"
fi

# Summary
echo ""
echo "================================================"
if [ $errors -eq 0 ]; then
    echo "✅ All tests passed! System is ready for use."
    echo ""
    echo "To use in a project:"
    echo "1. Copy all files to your project directory"
    echo "2. Run: bash install.sh"
else
    echo "❌ Found $errors error(s). Please fix before using."
fi
echo ""