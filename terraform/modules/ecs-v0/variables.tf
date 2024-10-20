ALL OF THE VARIABLES FOR TWEAKING
- some defaulted, some not (mandatory definitions needed in service)

variable "crawler_tasks" {
  type        = number
  description = "The number of crawler ECS tasks to run."
  default     = 0
}

variable "controller_tasks" {
  type        = number
  description = "The number of controller ECS tasks to run."
  default     = 2
}