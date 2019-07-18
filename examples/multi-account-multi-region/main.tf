// Creates a peering between VPCs different accounts and different regions
module "multi_account_multi_region" {
  source = "../../"

  providers = {
    aws.this = "aws.this"
    aws.peer = "aws.peer"
  }

  this_vpc_id = "${var.this_vpc_id}"
  peer_vpc_id = "${var.peer_vpc_id}"

  peer_region = "us-west-1"

  create_peering      = true
  auto_accept_peering = true

  tags = {
    Name        = "tf-single-account-multi-region"
    Environment = "Test"
  }
}