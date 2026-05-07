---
name: shared-workflows-guider
description: Use this skill to choose and document the correct reusable workflow or composite setup action from this repository.
---

# shared-workflows-guider

## Purpose
Use this skill to ground work against the actual reusable GitHub Actions assets in this repository. It helps an agent choose the right workflow or setup action, distinguish public entry points from local test harnesses, and avoid inventing unsupported CI capabilities.

## Instructions
1. Start from the checked-in workflow and action files under `.github/workflows/` and `.github/actions/`. Treat those YAML files as the source of truth for supported behavior and inputs.
2. Prefer the reusable workflow files without the `-call` suffix when advising consumers. Treat `*-call.yaml` files as repository-local validation harnesses unless the task is explicitly about local CI coverage.
3. Map language-specific requests to the correct reusable workflow:
   - Go test/lint: `.github/workflows/golang-test-lint.yaml`
   - Go binary release: `.github/workflows/golang-binary-release.yaml`
   - Node.js test/lint: `.github/workflows/nodejs-test-lint.yaml`
   - Node.js package release: `.github/workflows/nodejs-package-release.yaml`
   - Python test/lint: `.github/workflows/python-test-lint.yaml`
   - Docker image build/release: `.github/workflows/docker-build-release.yaml`
4. When setup behavior matters, inspect the composite actions directly:
   - `setup-go-env` for Go module caching and dependency download
   - `setup-node-env` for Node.js and Yarn install flows
   - `setup-python-env` for Poetry-based Python installs
   - `setup-pulumi-env` for Pulumi CI setup across Go or Node.js runtimes
   - `setup-act-env` for `act` compatibility in local runs
5. Call out workflow-specific constraints when they affect usage. In particular, both release workflows validate tag/default-branch conditions outside `act`, and the Pulumi setup action runs `make generate_schema`.
6. If documentation or a requested capability is missing, do not infer it from README examples alone. Verify it in the YAML, then update `AGENTS.md` and any affected docs so they match the checked-in implementation.
7. Do not claim MCP server support from this repository unless checked-in MCP configuration files are added. Today the repository provides GitHub workflow assets, not MCP applications.
