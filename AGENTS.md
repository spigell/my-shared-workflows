# AGENTS

## Purpose
This repository ships reusable GitHub Actions workflows and composite setup actions for Go, Node.js, Python, Docker image builds, and Pulumi-oriented CI setup.

## Repo-local Skills
- `shared-workflows-guider` - Use this skill when you need to inspect the checked-in reusable workflows or composite setup actions, distinguish consumer entry points from `*-call.yaml` validation harnesses, and align docs with the YAML that actually ships.

The repository currently contains no other repo-local skill definitions under `.agents/skills/`.

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
- No repo-local MCP server configuration or application manifests were found in the repository root, `.github/`, or `.agents/`. There is no checked-in `.mcp.json`, `mcp.json`, or other explicit MCP server registration in this repository.
- The workflows and setup actions rely on external GitHub Actions including `actions/cache`, `actions/checkout`, `actions/setup-go`, `actions/setup-node`, `actions/setup-python`, `astral-sh/ruff-action`, `benjlevesque/short-sha`, `docker/build-push-action`, `docker/login-action`, `docker/setup-buildx-action`, `golangci/golangci-lint-action`, `goreleaser/goreleaser-action`, `jaxxstorm/action-install-gh-release`, `JS-DevTools/npm-publish`, `pulumi/actions`, `reviewdog/action-eslint`, and `snok/install-poetry`.
