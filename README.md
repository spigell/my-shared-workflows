# Shared GitHub Workflows

Reusable GitHub Actions workflows and composite actions for Go (Golang), NodeJS/TypeScript, and Python projects.

## 📁 Structure
```
.github/
├── workflows/
│   ├── golang-*.yaml    # Go reusable workflows
│   ├── nodejs-*.yaml    # Node.js reusable workflows
│   ├── python-*.yaml    # Python reusable workflows
│   └── *-call.yaml      # Wrappers for local testing
├── actions/
│   ├── setup-go-env     # Composite Go setup
│   ├── setup-node-env   # Composite Node.js setup
│   ├── setup-python-env # Composite Python setup
│   └── setup-act-env    # Setup for local `act` testing
└── testdata             # Project samples for integration testing
```

## 🚀 Reusable Workflows

### Node.js: Test and Linting
Runs unit tests with `vitest` and linter with `eslint`.

**Workflow:** `.github/workflows/nodejs-test-lint.yaml`

```yaml
jobs:
  test:
    uses: your-org/shared-workflows/.github/workflows/nodejs-test-lint.yaml@main
    with:
      working-directory: '.'      # Optional
      node-version: '22'          # Optional
      test-flags: 'run'           # Optional: flags for vitest
      eslint-flags: '.'           # Optional: flags for eslint
```

### Python: Test and Linting
Runs unit tests with `pytest` and linter with `ruff`. Expects a Poetry-based project.

**Workflow:** `.github/workflows/python-test-lint.yaml`

```yaml
jobs:
  test:
    uses: your-org/shared-workflows/.github/workflows/python-test-lint.yaml@main
    with:
      working-directory: '.'      # Optional
      python-version: '3.13.7'    # Optional
      disable-linter: false       # Optional
```

### Node.js: Package Release
Publishes a Node.js package to NPM or GitHub Packages.

**Workflow:** `.github/workflows/nodejs-package-release.yaml`

```yaml
jobs:
  release:
    uses: your-org/shared-workflows/.github/workflows/nodejs-package-release.yaml@main
    with:
      platform: 'npm'             # 'npm' or 'github'
      package-directory: '.'      # Optional
      build-command: 'npm install'# Optional
      dry-run: false              # Optional
    secrets:
      token: ${{ secrets.NPM_TOKEN }}
```

## 🛠 Composite Actions

### Setup Node.js Environment
Installs Node.js, caches `yarn` dependencies, and runs `yarn install`.

**Action:** `.github/actions/setup-node-env`

```yaml
steps:
  - uses: your-org/shared-workflows/.github/actions/setup-node-env@main
    with:
      node-version: '22'
      working-directory: '.'
```

### Setup Python Environment
Installs Poetry, Python, and project dependencies from `poetry.lock`.

**Action:** `.github/actions/setup-python-env`

```yaml
steps:
  - uses: your-org/shared-workflows/.github/actions/setup-python-env@main
    with:
      python-version: '3.13.7'
      working-directory: '.'
```

🧪 Integration Testing

Integration tests are executed automatically on push and pull requests using the projects in the `testdata` directory.

Local Testing with `act`:
```bash
act -W ./.github/workflows/nodejs-package-release-call.yaml \
  --input working-directory=./testdata/nodejs \
  -P ubuntu-24.04=ghcr.io/catthehacker/ubuntu:act-24.04 \
  --secret token=1111 \
  --input package-directory=./testdata/nodejs \
  --input dry-run=true
```
