# terraform_naming
terraform resource naming project

### resource_naming Module

This module generates resource names based on provided inputs. It supports three resource types: `virtual_machine`, `key_vault`, and `storage_account`.

#### Naming Rules

- **virtual_machine**: Appends `vm-` to the front and `-00` to the back of the base name. Truncates the base name if the total length exceeds 15 characters.
- **key_vault**: Appends `kv-` to the front and converts the name to lowercase.
- **storage_account**: Appends `sa` to the front, removes all hyphens, and converts the name to lowercase.

#### Inputs

- `base_name`: The base name for the resource.
- `resource_type`: The type of the resource. Must be one of `virtual_machine`, `key_vault`, or `storage_account`.

#### Outputs

- `resource_name`: The generated resource name.

### resource_management Module

This module takes a map of resource definitions and uses the `resource_naming` module to generate names for each resource.

#### Inputs

- `resource_map`: A map where the key is the base name and the value is the resource type.

#### Outputs

- `resource_names`: A map of generated resource names.

### root Module

An example root module to demonstrate the usage of the `resource_management` module.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- A GitHub repository containing this project.

### Usage

1. Clone the repository:
    ```bash
    git clone <your-repo-url>
    cd terraform-naming-module/root
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Apply the configuration:
    ```bash
    terraform apply
    ```

4. Review the output to see the generated resource names.

### Example

The `root/main.tf` file provides an example usage of the `resource_management` module:

```hcl
module "resource_management" {
  source = "../resource_management"

  resource_map = {
    "example-vm-name"    = "virtual_machine",
    "example-keyvault"   = "key_vault",
    "example-storage"    = "storage_account"
  }
}

output "resource_names" {
  value = module.resource_management.resource_names
}

