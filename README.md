# create a number of s3 buckets for testing purposes

```bash
s3_buckets
        ├── LICENSE
        ├── README.md
        └── terraform
            ├── main.tf
            ├── terraform.tfstate
            ├── terraform.tfstate.backup
            └── tf.plan

2 directories, 6 files
```
In order to make it easier to review the TF plan, or to supply the plan as an artifact in a commit, or a change request,
 I have set up a simple command alias

I also add a switch to the `terraform plan` command to save a copy of the plan in plain text (which the tfplan alias
then converts to a file containing ascii colour coding)

The plan file is called `tf.plan`

```bash
# add this command alias interactively, or to your ~/.bashrc or ~/.zshrc file
alias tfplan='terraform show  tf.plan > tfplan.ansi && less tfplan.ansi'
```

Then run commands like this
```bash
terraform plan -out=tf.plan
```

to review the plan, just type the command `tfplan`

This project also has pre-commit hooks configured. To use them, simply install the pre-commit package
by following the instructions here - https://pre-commit.com/

To activate pre-commit in your project, cd to the local project root, and run `pre-commit install` to set up the
githooks in your repository

```bash
pip3 install pre-commit
pre-commit install
```

To test it ...
```bash
pre-commit run --all-files
```
