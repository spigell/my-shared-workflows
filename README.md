# Shared GitHub Workflows

Reusable GitHub Actions workflows and composite actions for Go (Golang) and NodeJS/TypeScript projects.

## 📁 Structure
```
.github/
├── workflows/
│ ├── *.yaml # Reusable workflows
│ ├── *-call.yaml # Wrappers for local testing
├── actions/ # Composite setup action
testdata # Projects for testing
```

## 🚀 Usage
Example:

```yaml
jobs:
  test:
    uses: your-org/shared-workflows/.github/workflows/golang-test-lint.yaml@main
    with:
      go-version: '1.22'
      working-directory: '.'
  release:
    uses: your-org/shared-workflows/.github/workflows/npm-package-release.yaml@main
    with:
      working-directory: '.'
      platform: npm
    secrets:
      gh-token: ${{ secrets.NPM_TOKEN }}
```

🧪 Local Testing

Test with act:
```
act workflow_dispatch \
  -W .github/workflows/golang-test-call.yaml \
  -P ubuntu-24.04=ghcr.io/catthehacker/ubuntu:act-24.04
```
