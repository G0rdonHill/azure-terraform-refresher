# Azure Terraform Refresher

Following on from my 2024 career break (travelling for 4 months), this repo is used as a hands-on refresher in getting some infra up and running in a trial subscription.

Initially, this will create a VM, associated network resources, and an AKS instance (B series compute to reduce costs).

This will also kickstart a reusuable terraform module library which can be used in future projects.

## Getting started

### Tools required
- ASDF
  - Terraform
  - Az CLI

### Installation

To install the required CLI tools via ASDF (recommended) - navigate to the root of the repo via terminal and run:
  `asdf install`