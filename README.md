# Shared GitHub Workflows

Reusable GitHub Actions workflows and composite actions for Go (Golang), NodeJS/TypeScript, and Python projects.

## 📁 Structure
```
.github/
├── workflows/
│   ├── golang-*.yaml    # Go reusable workflows
│   ├── nodejs-*.yaml    # Node.js reusable workflows
│   ├── python-*.yaml    # Python reusable workflows
├── actions/
│   ├── setup-*-env      # Composite setup actions
└── testdata             # Project samples for integration testing
```

## 🚀 Usage Example

All workflows follow a similar pattern. Here is how to use the Go test and linting workflow:

```yaml
jobs:
  test:
    uses: your-org/shared-workflows/.github/workflows/golang-test-lint.yaml@main
    with:
      working-directory: '.'
      test-flags: '-v'
```

For other languages (Node.js, Python) or actions, refer to the files in `.github/workflows/` and `.github/actions/`.

🧪 Integration Testing

Integration tests run automatically on push/PR using `testdata/`.

Local testing with `act`:
```bash
act -W ./.github/workflows/nodejs-test-lint-call.yaml --input working-directory=testdata/nodejs
```
