# mock-plugin-policies-2

Mock repo for developing CCF release automation. Not a product.

## Layout

- `policies/`: one Rego package (`compliance_framework.mock_default_branch`) with its `_test.rego` tests.
- `make test` runs `opa test policies`; `make build` writes `dist/bundle.tar.gz`.

`policies/mock_default_branch.rego` deliberately contains one `opa fmt` issue, so the shared
policy CI's format check fails on this repo. `opa check` and `opa test` still pass. The S1
adoption PR fixes it.
