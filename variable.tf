variable "region" {}
variable "region_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "ami" {}
variable "user" {}
variable "zone_id" {}
variable "domain" {}

variable "az1" {}
variable "az2" {}
variable "az3" {}

variable "cidr_block" {}

variable "cidr_block1_public" {}
variable "cidr_block2_public" {}
variable "cidr_block3_public" {}

variable "cidr_block1_private" {}
variable "cidr_block2_private" {}
variable "cidr_block3_private" {}

variable "tags" {
  type = "map"
}
