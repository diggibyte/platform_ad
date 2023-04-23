# Introduction 
Platform Dev project is used to configure access across platform. Core objective of the project is as below:

- Add, Update or Removed user to ADD Groups
- Provide or Remove resource-group level access to AAD groups.

All such permissions and access information are managed using JSON configuration file. This configuration files are managed seperatly for FS(Fullstack) and DL(Datalake) team. There is 3 JSON configuration file each team defined as below:

- *_adgroup_rbac_mapping: 

  - This configuration file contains RBAC permission information for AAD Group.

- *_azure_role_definitions:

    - This configuration file contains access and permission rules for custom RBAC role

- *_user_adgroup_mapping:
  
  - This configuration file contains mapping information between USER and AAD group

# Getting Started
Kindly follow list of activity mentioned below to configure your system to run the project. 
1.	Install Terraform: [link](https://developer.hashicorp.com/terraform/downloads)
2.	Clone git repository using below command:
```
git clone https://github.com/diggibyte/platform_ad.git
```
3.  Add platform_tfmodules repository as git submodule
```
git submodule add -b master https://github.com/diggibyte/platform_tfmodules.git
git submodule init
```
4.	_[Optional]:_ if step 3 is throwing authentication error then kindly follow below step:

- Create Personal access token: [link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- Run below command:
```commandline
git config --global url."https://oauth2:<ACCESS_TOKEN>".insteadOf "git@github.com:"
git submodule add -b master https://github.com/diggibyte/platform_tfmodules.git
git submodule init
```

5.  make sure you have all the required variables in class path to update remote state on azure 

- For mac n linux
```
export TF_VAR_subscription_id="XXXXXX-XX-XXX-XX-XXXXXXXX"
export TF_VAR_tenant_id="XXXXXXX-XXX-XXX-XXXX-XXXXXXXXX"
export TF_VAR_client_id="XXXXXXXX-XXX-XXX-XXX-XXXXXXXX"
export TF_VAR_client_secret="XXXXXXXXXXXXXXXXXXXXXXXX"
export TF_VAR_access_key=XXXXXXXXXbS1V009Bwn7oWWLNsZuXd5wVQiv8rpLTwXXXXXXXXXXXXXXdQ==
```

- For mac n linux
```
set TF_VAR_subscription_id="XXXXXX-XX-XXX-XX-XXXXXXXX"
set TF_VAR_tenant_id="XXXXXXX-XXX-XXX-XXXX-XXXXXXXXX"
set TF_VAR_client_id="XXXXXXXX-XXX-XXX-XXX-XXXXXXXX"
set TF_VAR_client_secret="XXXXXXXXXXXXXXXXXXXXXXXX"
set TF_VAR_access_key=XXXXXXXXXbS1V009Bwn7oWWLNsZuXd5wVQiv8rpLTwXXXXXXXXXXXXXXdQ==
```

# Build and Test
Now run below command to execute the code
```
terraform -chdir="./datalake/"  init 
terraform -chdir="./datalake/"  plan
```

# Contribute
For this project you need to only update JSON configuration file to make access level changes on platform