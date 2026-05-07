# AGENTS

## Purpose
This repository ships reusable GitHub Actions workflows and composite setup actions for Go, Node.js, Python, Docker image builds, and Pulumi-oriented CI setup.

## Repo-local Skills
- `shared-workflows-guider` - Use this skill when you need to choose, inspect, or document the correct reusable workflow or composite setup action in this repository.

## Reusable Workflows
- `.github/workflows/golang-test-lint.yaml` - Runs Go unit tests and optional `golangci-lint`, with support for either `setup-go-env` or `setup-pulumi-env`.
- `.github/workflows/golang-binary-release.yaml` - Publishes Go binaries with GoReleaser after validating that the run is on a tag from the default branch.
- `.github/workflows/nodejs-test-lint.yaml` - Runs Node.js unit tests with `yarn vitest` and optional ESLint reporting through Reviewdog.
- `.github/workflows/nodejs-package-release.yaml` - Builds and publishes a Node.js package to npm or GitHub Packages, with optional Pulumi setup and dry-run support.
- `.github/workflows/python-test-lint.yaml` - Runs Python tests with Poetry and `pytest`, plus optional Ruff linting.
- `.github/workflows/docker-build-release.yaml` - Builds and optionally pushes Docker images to GHCR, including support for build args and extra build contexts.

## Local Validation Workflows
- `.github/workflows/golang-test-lint-call.yaml`
- `.github/workflows/golang-binary-release-call.yaml`
- `.github/workflows/nodejs-test-lint-call.yaml`
- `.github/workflows/nodejs-package-release-call.yaml`
- `.github/workflows/python-test-lint-call.yaml`
- `.github/workflows/docker-build-release-call.yaml`

These `*-call.yaml` files are repository test harnesses for local CI coverage. They are not the reusable workflow entry points consumers should reference.

## Composite Actions
- `.github/actions/setup-act-env/action.yaml` - Mirrors local actions into `.github/actions_ext` so `act` can run workflows without cloning the repository.
- `.github/actions/setup-go-env/action.yaml` - Restores Go caches, installs Go from `go.mod`, and downloads Go modules.
- `.github/actions/setup-node-env/action.yaml` - Installs Node.js, enables Yarn caching, and installs project dependencies.
- `.github/actions/setup-pulumi-env/action.yaml` - Prepares Pulumi CI for Go or Node.js runtimes, installs Pulumi tooling, and runs `make generate_schema`.
- `.github/actions/setup-python-env/action.yaml` - Installs Poetry, configures Python, restores Poetry caches, and installs dependencies from `pyproject.toml`.

## MCP And Tooling Notes
- No repo-local MCP server configuration or application manifests were found. There is no checked-in `.mcp.json`, `mcp.json`, or other explicit MCP server registration in this repository.
- The repository does depend on external GitHub Actions such as `actions/checkout`, `actions/setup-go`, `actions/setup-node`, `actions/setup-python`, `docker/build-push-action`, `goreleaser/goreleaser-action`, `reviewdog/action-eslint`, `astral-sh/ruff-action`, and `pulumi/actions`.
