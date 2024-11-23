//Configuration des providers
provider "aws" {
    region = var.aws_region
}

// Création du repository ECR
resource "aws_ecr_repository" "catalog_repo" {
    name = var.aws_ecr_repository_name
    image_tag_mutability = "MUTABLE"
}

// Création d’un cluster ECS
resource "aws_ecs_cluster" "catalog_cluster" {
    name = var.ecs_cluster_name
}

// Création de la task definition ECS
resource "aws_ecs_task_definition" "catalog_task" {
    family = var.ecs_task_family
    container_definitions = <<DEFINITION
    [
        {
            "name":"catalog",
            "image":"${aws_ecr_repository.catalog_repo.repository_url}:latest",
            "memory":512,
            "cpu": 256,
            "essential":true
        }
    ]
    DEFINITION
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    memory                   = "512"
    cpu                      = "256"
    execution_role_arn       = aws_iam_role.ecs_task_execution.arn
}