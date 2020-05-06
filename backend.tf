terraform {
  backend "s3" {
    bucket = "project-yusuf"
    key    = "path/to/my/key"

    #dynamodb_table = 
    region = "us-east-1"
  }
}
