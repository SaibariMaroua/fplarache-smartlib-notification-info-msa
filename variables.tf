variable "aws_region" {
 default = "eu-north-1"
}
variable "ecr_repository_name"{
default = "dev-fplarache-smartlib-notification-repo-msa"
}
variable "ecs_cluster_name"{
default = "dev-fplarache-smartlib-notification-fgcluster-msa"
}
variable "ecs_task_family"{
default = "dev-fplarache-smartlib-notification-td-msa"
}
variable "ecs_service_name"{
default = "dev-fplarache-smartlib-notification-fgservice-msa"
}
variable "subnets_ids" {
type = list(string)
default = ["subnet-0cf9e8ccfb6fd0f77", "subnet-05fac6b2678b41a37", "subnet-00d967507df4b0bfb"]
}