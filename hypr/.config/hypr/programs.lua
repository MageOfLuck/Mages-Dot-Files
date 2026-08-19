-------------------
---- AUTOSTART ----
-------------------

--
hl.on("hyprland.start", function ()
  hl.exec_cmd("dbus-update-activation-environment --systemd XDG_DATA_DIRS XDG_CURRENT_DESKTOP") 
  hl.exec_cmd("wezterm")
  hl.exec_cmd("hyprpaper & librewolf")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("easyeffects")
  hl.exec_cmd("wayle shell")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("vicinae server")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "plasma-")
hl.env("XDG_DATA_DIRS", "/usr/share:/usr/local/share:$XDG_DATA_DIRS")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("WLR_DRM_NO_ATOMIC", "0")
hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("NVD_BACKEND", "direct")
hl.env("XDG_DATA_DIRS", os.getenv("HOME") .. "/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

 --hl.config({
 --  ecosystem = {
 --    enforce_permissions = true,
 --  },
 --})

 --hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "ask")
 --hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "ask")
 --hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "ask")
 --hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })