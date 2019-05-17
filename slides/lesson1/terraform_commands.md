---?color=var(--color-light-gray-2)

The set of files used to describe infrastructure in Terraform is simply known as a Terraform configuration. (*.tf) 

---
@title[provider]

```
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-02bcbb802e03574ba"
  instance_type = "t2.micro"
}
```
@[1-3](provider)
---
@title[Terraform Commands]
#### Terraform Commands

---
@title[What is Terraform?]
@snap[west span-85]
#### Terraform core commands
@ul[spaced text-black]
- init.
- plan.
- apply.
- destroy.
- fmt.
@ulend
@snapend
