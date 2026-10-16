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

### npm trusted publishing

The [Node.js package release workflow](.github/workflows/nodejs-package-release.yaml) accepts
`trusted-publishing: true` for direct, token-free publishing to the public npm
registry. It defaults to `false`, so existing token-based and staged callers
keep their current behavior. This mode requires `platform: npm` (the default)
and `staged: false` (the default). `dry-run: true` passes `--dry-run` to npm.
The workflow uses Node 24 and npm 11.15.0; npm requires Node >= 22.14.0 and
npm CLI >= 11.5.1 for trusted publishing. The publish command includes
`--provenance`; npm also generates provenance automatically for public packages
in public repositories when OIDC publishing succeeds.

The calling job must grant `contents: read` and `id-token: write`. Configure a
GitHub Actions trusted publisher in the package settings on npmjs.com with the
**calling repository and workflow filename**, not this reusable workflow's
filename. For `spigell/pulumi-talos-cluster`, enter organization/user `spigell`,
repository `pulumi-talos-cluster`, workflow filename
`tags-release-npm-package.yaml`, and no environment name unless the caller
uses a GitHub environment. Enable the **npm publish** allowed action so the
publish happens immediately without staged approval. The caller should omit
the `token` secret and set `trusted-publishing: true` instead of `staged: true`.
See [npm's trusted publishing documentation](https://docs.npmjs.com/trusted-publishers/),
including its reusable workflow troubleshooting note. npm checks the caller's
workflow filename, and `id-token: write` is required in both workflows.

🧪 Integration Testing

Integration tests run automatically on push/PR using `testdata/`.

Local testing with `act`:
```bash
act -W ./.github/workflows/nodejs-test-lint-call.yaml --input working-directory=testdata/nodejs
```
