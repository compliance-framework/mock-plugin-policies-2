package compliance_framework.mock_default_branch

# Mock policy for CCF release automation. Not a product check.
# Flags a repository whose default branch is not "main".

risk_templates := [{
	"name": "Repository default branch is not main",
	"title": "Repository Uses a Non-Standard Default Branch",
	"statement": "Mock risk: a repository whose default branch is not 'main' does not follow the organization convention.",
	"likelihood_hint": "low",
	"impact_hint": "low",
	"violation_ids": ["default_branch_not_main"],
	"remediation": {
		"title": "Rename the default branch to main",
		"description": "Mock remediation: rename the repository's default branch to 'main'.",
		"tasks": [{"title": "Rename the default branch to main in the repository settings"}],
	},
}]

violation contains {"id": "default_branch_not_main"} if {
	# DELIBERATE `opa fmt` ISSUE (W1-S0-T06): no spaces around "!=" below. Do NOT fix here.
	# It proves the shared ci-policies.yml fails on formatting; the S1 adoption PR fixes it.
	input.repository.default_branch!="main"
}

title := "Repository default branch is main"

description := "Mock check: the repository's default branch should be named 'main'."

remarks := "Mock policy used to exercise the shared policy CI. Not a real compliance control."
