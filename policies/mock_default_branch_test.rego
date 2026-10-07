package compliance_framework.mock_default_branch

test_default_branch_main if {
	count(violation) == 0 with input as {"repository": {"default_branch": "main"}}
}

test_default_branch_violate_if_not_main if {
	violation == {{"id": "default_branch_not_main"}} with input as {"repository": {"default_branch": "master"}}
}

test_default_branch_violate_if_missing if {
	violation == {{"id": "default_branch_not_main"}} with input as {"repository": {}}
}
