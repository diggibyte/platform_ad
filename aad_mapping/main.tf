
locals {
  #  Datalake Config file path
  dl_user_aadg_mpg        = "${path.root}/config/dl_user_aadgroup_mapping.json"
  dl_aadg_rbac            = "${path.root}/config/dl_adgroup_rbac_mapping.json"
  dl_aad_role_definations = "${path.root}/config/dl_azure_role_definitions.json"

  #  Fullstack Config file_path
  fs_user_aadg_mpg        = "${path.root}/config/fs_user_aadgroup_mapping.json"
  fs_aadg_rbac            = "${path.root}/config/fs_adgroup_rbac_mapping.json"
  fs_aad_role_definations = "${path.root}/config/fs_azure_role_definitions.json"
}

module "dgb_dl_access" {
  source                    = "../platform_tfmodules/platform_access_manager"
  aad_role_definitions_path = local.dl_aad_role_definations
  aadg_rbac_path            = local.dl_aadg_rbac
  user_aadg_mpg_path        = local.dl_user_aadg_mpg
}

module "dgb_fs_access" {
  source                    = "../platform_tfmodules/platform_access_manager"
  aad_role_definitions_path = local.fs_aad_role_definations
  aadg_rbac_path            = local.fs_aadg_rbac
  user_aadg_mpg_path        = local.fs_user_aadg_mpg
}