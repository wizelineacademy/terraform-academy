---?color=var(--color-light-gray-2)

@title[What is a Resource?]
@snap[west span-85]
#### What is a Resource

In Terraform's configuration language: A Resource is a block that describes one or more infrastructure objects. 

Resources can be things like virtual networks, compute instances, or higher-level components such as DNS records
@snapend

---


@title[What is a Variable?]
@snap[west span-85]
#### What is a Variable

Also "input variables".

In Terraform, "variables" almost always refers to input variables, which are key/value pair

@snapend

```hcl
$ terraform plan \
  -var 'myvar1=foo' \
  -var 'myvar2=bar'
```

---
@title[Types of Variables]
@snap[west span-85]
#### Types of Variables
@ul[spaced text-black]
- string.
- number.
- bool.
- lists.
- maps.
@ulend
@snapend
 ---

## Strings
```hcl
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-asbdas123"
}
```
---
## Numbers
```hcl
variable "asg_num_of_instances" {
  type        = number
  description = "The id of the machine image (AMI) to use for the server."
  default = 2
}
```
---
## Lists

Lists are defined either explicitly or implicitly

```hcl
# implicitly by using brackets [...]
variable "cidrs" { 
  default = ["10.0.0.0/16", "10.1.0.0/16"] 
}

# explicitly
variable "cidrs" { 
  type = "list" 
}
```
---
## Maps

```hcl
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
```

---
@title[Data Souces]
@snap[west span-85]
#### Data Sources

Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined by another separate Terraform configuration.

@snapend
---

```hcl
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```