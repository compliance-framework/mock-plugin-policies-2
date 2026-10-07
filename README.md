# mock-plugin-policies-2

Mock repo for developing CCF release automation. Not a product.

## Layout

- `policies/`: one Rego package (`compliance_framework.mock_default_branch`) with its `_test.rego` tests.
- `make test` runs `opa test policies`; `make build` writes `dist/bundle.tar.gz`.
- `.github/workflows/ci.yml` runs the shared policy CI (`compliance-framework/workflows` `ci-policies.yml`) on pull requests and pushes to `main`; `ci / required` is the status check to require.
- Releases use the shared release automation (`compliance-framework/workflows`), pinned to one commit:
  - `release-please.yml` opens the release PR on pushes to `main` (settings in `release-please-config.json`, which copies the shared `release-please/defaults.json`; versions in `.release-please-manifest.json` and `version.txt`);
  - `release.yml` publishes the policy bundle (`release-policies.yml`) when a release is published;
  - `preview.yml` publishes `pr-<number>` for PRs labelled `preview` (no `main` previews);
  - `ci.yml` also runs `release-checks` on release-please PRs.
