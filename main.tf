//Configuration des providers
provider "aws" {
    region = var.aws_region
}
// Création du repository ECR
resource "aws_ecr_repository" "catalog_repo" {
    name = var.aws_ecr_repository_name
    image_tag_mutability = "MUTABLE"
}
