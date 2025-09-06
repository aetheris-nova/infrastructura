<div align="center">
  <img alt="An ornate golden compass surrounded by orbs" src="docs/images/emblem@128x128.png" height="128" />
</div>

<div align="center">

[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-brightgreen.svg)][license]

</div>

<div align="center">

[![Boundary](https://github.com/aetheris-nova/infrastructura/actions/workflows/boundary.yml/badge.svg?branch=main)](https://github.com/aetheris-nova/infrastructura/actions/workflows/boundary.yml/badge.svg)
[![Sandbox](https://github.com/aetheris-nova/infrastructura/actions/workflows/sandbox.yml/badge.svg?branch=main)](https://github.com/aetheris-nova/infrastructura/actions/workflows/sandbox.yml/badge.svg)

</div>

<h1 align="center">
  Infrastructura
</h1>

<p align="center">
  The Infrastructura of the Ordo Aedificatorum contains the grimoire to command the very foundations of the Aetheris Nova's sacred machinations.
</p>

---

### Table of contents

* [1. Introduction](#-1-introduction)
- [2. Requirements](#-2-requirements)
- [3. Set up a new environment](#-3-set-up-a-new-environment)
    * [3.1. Set up Terraform Cloud](#31-set-up-terraform-cloud)
    * [3.2. Add a new directory](#32-add-a-new-directory)
    * [3.3. Add Terraform API token](#33-add-terraform-api-token)
    * [3.4. Setup GitHub Actions workflow](#34-setup-github-actions-workflow)
- [4. Miscellaneous](#-4-miscellaneous)
    * [4.1. Useful commands](#41-useful-commands)
- [5. How to contribute](#-5-how-to-contribute)
- [6. License](#-6-license)

## 🎉 1. Introduction

All elements of the infrastructure are to be written in code, using Terraform, and put under source control. The main objective of implementing infrastructure as code (IaC) for the platform is the need to easily spin up an entire environment and for traceability; it’s important to know what changes have been made, and why.

## 📋 2. Requirements

* Terraform CLI [Terraform CLI 0.14+](https://www.terraform.io/downloads.html)

<sup>[Back to top ^][table-of-contents]</sup>

## 📐 3. Set up a new environment

Below outlines the steps necessary to create a new environment. For the purpose of this guide, we will be creating a new environment called: `boundary`.

See this [guide](https://learn.hashicorp.com/tutorials/terraform/github-actions) for more information. 

<sup>[Back to top ^][table-of-contents]</sup>

### 3.1. Set up Terraform Cloud

1. On the "Workspaces" page, press "New workspace" and select "API-driven workflow". Name your workspace `boundary` and click "Create workspace".

2. Next, go to the variables menu and under **Workspace variables** select **Terraform variable**, then add, at the very least:
    * `digitalocean_access_token` - the Digital Ocean personal access token that gives Terraform accesses to orchestrate resources on DigitalOcean.

<sup>[Back to top ^][table-of-contents]</sup>

### 3.2. Add a new directory

1. Create a new directory: `./workspaces/boundary`

2. Create a new `./workspaces/boundary/versions.tf` file and add the following:
```terraform
terraform {
  # use terraform cloud to handle state
  cloud {
    organization = "aetherisnova"

    workspaces {
      name = "boundary"
    }
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
```

3. Create a new `./workspaces/boundary/variables.tf` file and add the following:
```terraform
# A Digital Ocean personal access token.
variable "digitalocean_access_token" {
  type = string
}

# The region to deploy the infrastructure to.
# See https://slugs.do-api.dev/ for valid options.
variable "region" {
  type    = string
  default = "ams3"
}
```

4. Create a new `./workspaces/boundary/provider.tf` file and add the following:
```terraform
provider "digitalocean" {
  token = var.digitalocean_access_token
}
```

5. Create a new `./workspaces/boundary/main.tf` file here you can start adding resources.

<sup>[Back to top ^][table-of-contents]</sup>

### 3.3. Create a Terraform API token

1. Go to GitHub, navigate to "Settings" then "Secrets". Create a new secret named `TERRAFORM_API_TOKEN`, setting the [Terraform Cloud API token](https://app.terraform.io/app/aetherisnova/settings/authentication-tokens).

<sup>[Back to top ^][table-of-contents]</sup>

### 3.4. Setup GitHub Actions workflow

1. Create a new workflow YAML file `./.github/workflows/boundary.yml` and add the following:
```yaml
name: Production - France

on:
  push:
    branches:
      - main
    paths:
      - 'workspaces/boundary/**'
  pull_request:
    paths:
      - 'workspaces/boundary/**'

jobs:
  default_workflow:
    name: "Validate, Plan and Apply"
    uses: ./.github/workflows/validate_plan_and_apply.yml
    with:
      workspace_name: "boundary"
    secrets:
      TERRAFORM_API_TOKEN: ${{ secrets.TERRAFORM_API_TOKEN }}
```

<sup>[Back to top ^][table-of-contents]</sup>

## 📑 4. Miscellaneous

### 4.1. Useful commands

| Command                       | Description                                                                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `terraform init`              | Initialize the workspace ready to run plans.                                                                                            |
| `terraform fmt -recursive`    | Formats all the `.tf` files in the current directory and subdirectories. Useful to use before opening PRs, otherwise they will fail CI. |
| `terraform plan -input=false` | Runs a plan using the variables stored on Terraform Cloud.                                                                              |

<sup>[Back to top ^][table-of-contents]</sup>

## 👏 5. How to contribute

Please read the [**Contributing Guide**](https://github.com/aetheris-nova/infrastructura/blob/main/CONTRIBUTING.md) to learn about the development process.

<sup>[Back to top ^][table-of-contents]</sup>

## 📄 6. License

Please refer to the [LICENSE][license] file.

<sup>[Back to top ^][table-of-contents]</sup>

<!-- links -->
[license]: https://github.com/aetheris-nova/infrastructura/blob/main/LICENSE
[table-of-contents]: #table-of-contents
