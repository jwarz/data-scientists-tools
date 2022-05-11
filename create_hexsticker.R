sysfonts::font_add_google("Raleway", "pf", regular.wt = 500)
hexSticker::sticker(
  subplot = ~ plot.new(), s_x = 1, s_y = 1, s_width = 0.1, s_height = 0.1,
  package = "cluster", p_x = 1, p_y = 1, p_size = 8, h_size = 1.2, p_family = "pf",
  p_color = "#2dc6d6", h_fill = "transparent", h_color = "#2dc6d6",
  dpi = 320, filename = "~/03_repos/data-scientists-tools/img/hex_cluster.png"
)



imgurl <- "~/03_repos/data-scientists-tools/img/logo_R.svg"

hexSticker::sticker(imgurl, package="base", p_size=8, s_x=1, s_y=.75, s_width=.5,
                    p_color = "#2dc6d6", h_fill = "transparent", h_color = "#2dc6d6",
        filename="~/03_repos/data-scientists-tools/img/hex_R.png")
