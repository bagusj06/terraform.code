terraform {
  backend "s3" {
    bucket = "bagus-tf-be"
    key    = "state"
    region = "ap-southeast-1"
  }
}
