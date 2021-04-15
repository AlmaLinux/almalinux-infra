# AlmaLinux Build System production infrastructure

Provisions AlmaLinux Build System production infrastructure.

**Warning**: this project is in a very early stage and is not ready for
production usage. It is also not intended for use by someone except
AlmaLinux Build System developers.


## Getting started

1. Install [Terraform](https://www.terraform.io/), instructions for RPM-based
   distributions are available [here](https://www.terraform.io/docs/cli/install/yum.html).

2. Configure your AWS credentials in one of the following ways:

    * Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
      and [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config)
      your AWS Access Key ID and AWS Secret Access Key.  
      Export the `AWS_DEFAULT_REGION` environment variable:
      ```bash
      export AWS_DEFAULT_REGION='us-west-2'
      ```
    * Configure AWS credentials with environment variables as described in the
      `aws` provider [manual](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables).

3. Initialize a Terraform environment:
   ```bash
   $ cd buildsys_prod
   $ terraform init
   ```

4. To apply your changes to the configuration use the following command:
   ```bash
   $ terraform apply
   ```
