# mock-plugin-policies-2

Mock repo for developing CCF release automation. Not a product.

## Layout

- `policies/`: one Rego package (`compliance_framework.mock_default_branch`) with its `_test.rego` tests.
- `make test` runs `opa test policies`; `make build` writes `dist/bundle.tar.gz`.
- `.github/workflows/ci.yml` runs the shared policy CI (`compliance-framework/workflows` `ci-policies.yml`) on pull requests and pushes to `main`; `ci / required` is the status check to require.
