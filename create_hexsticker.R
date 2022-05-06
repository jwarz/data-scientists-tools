sysfonts::font_add_google("Raleway", "pf", regular.wt = 500)
hexSticker::sticker(
  subplot = ~ plot.new(), s_x = 1, s_y = 1, s_width = 0.1, s_height = 0.1,
  package = "pROC", p_x = 1, p_y = 1, p_size = 8, h_size = 1.2, p_family = "pf",
  p_color = "#2dc6d6", h_fill = "#EBE4C4", h_color = "#2dc6d6",
  dpi = 320, filename = "~/03_repos/data-scientists-tools/img/logo_test.png"
)
