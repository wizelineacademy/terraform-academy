# Terraform Academy

Hashicorp Terraform is an open-source tool to provision infrastructure resources in different service providers (including cloud platforms). It is used by many companies to manage their cloud-based solutions and speed up the development and deployment of their applications.

This Academy course teaches you the basic concepts of Terraform in an easy-to-follow way using AWS as the cloud provider. Make sure to follow the instructor's directions to get the most out of this workshop and successfully plan, apply and destroy your resources.

## Using Cloud9

Cloud9 is an IDE in the cloud, we recommend using this environment to follow the workshop since it already has Terraform and other tools installed in a Linux environment running in AWS.

Use the following CloudFormation template to spin up a Cloud9 environment in us-east-1 (N. Virginia), just click _Next_, _Next_, _Next_ and _Create Stack_:

[![Launch Stack](https://cdn.rawgit.com/buildkite/cloudformation-launch-stack-button-svg/master/launch-stack.svg)](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=TerraformAcademy&templateURL=https://terraform-wizeline-academy.s3.amazonaws.com/cloud9-cfn-template.yaml)

Go to your [Cloud9 service](https://console.aws.amazon.com/cloud9/home) inside the AWS console and click _Open IDE_ on your new environment called **TerraformAcademy**.

The environment will be pre-loaded with the contents of this repository in the **terraform-academy** folder.
