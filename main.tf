module "authentik" {
  source = "./modules/authentik"
  app_name_uptimekuma = var.uptimekuma
  app_name_pihole = var.pihole
  app_name_pihole2 = var.pihole2
  app_name_homarr = var.homarr
  app_name_jackett = var.jackett
  app_name_openwebui = var.openwebui
  app_name_comfyui = var.comfyui
  app_name_bazarr = var.bazarr
  # optionally, pass variables expected by your module here
}

module "storage" {
  source = "./modules/storage"
}

module "uptimekuma" {
  source = "./modules/uptimekuma"
  app_name = var.uptimekuma
  # optionally, pass variables expected by your module here
}

module "pihole" {
  source = "./modules/pihole"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
  app_name_uptimekuma = var.uptimekuma
  app_name_pihole = var.pihole
  app_name_pihole2 = var.pihole2
  app_name_homarr = var.homarr
  app_name_jackett = var.jackett
  app_name_openwebui = var.openwebui
  app_name_comfyui = var.comfyui
  app_name_bazarr = var.bazarr
  app_name_pterodactyl_panel = var.pterodactyl_panel
  # optionally, pass variables expected by your module here
}

module "homarr" {
  source = "./modules/homarr"
  app_name = var.homarr
  envs = var.homarr_envs
}

module "jackett" {
  source = "./modules/jackett"
  app_name = var.jackett
  envs = var.jackett_envs
}

module "ai" {
  source = "./modules/ai"
}

module "ollama" {
  source = "./modules/ai/ollama"
}

module "automatic1111" {
  source = "./modules/ai/automatic1111"
}

module "comfyui" {
  source = "./modules/ai/comfyui"
}

module "openwebui" {
  source = "./modules/ai/openwebui"
  app_name = var.openwebui
  envs = var.openwebui_envs
}

module "pterodactyl_panel" {
  source = "./modules/pterodactyl/panel"
  app_name = var.pterodactyl_panel
  envs = var.pterodactyl_panel_envs
}

module "pterodactyl_database" {
  source = "./modules/pterodactyl/database"
  app_name = var.pterodactyl_database
  envs = var.pterodactyl_database_envs
}

module "pterodactyl_cache" {
  source = "./modules/pterodactyl/cache"
  app_name = var.pterodactyl_cache
}

module "bazarr" {
  source = "./modules/bazarr"
  app_name = var.bazarr
  envs = var.bazarr_envs
}
