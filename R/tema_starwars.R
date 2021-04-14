meu_tema_starwars <- function(){
  fontTable = fonttable()
  
  ggplot2::theme(
    text = ggplot2::element_text(
      colour = "yellow",
      family = "Comic Sans MS Bold",
      size = 16
    ),
    plot.title = ggplot2::element_text(
      family = "Impact",
      hjust = 0.5,
      size = 30,
      colour = "orange",
    ),
    plot.subtitle = ggplot2::element_text(
      hjust = 0.5,
      size = 15,
      colour = "white",
    ),
    axis.text = ggplot2::element_text(color = "white",size=rel(.5)),
    axis.ticks.x = ggplot2::element_line(color = "white"),
    panel.background = ggplot2::element_rect(fill = "black"),
    panel.grid.major.y = ggplot2::element_line(size = 0.1,color="white"),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    plot.background = ggplot2::element_rect(fill = "black", color = "black"),
    legend.position = "bottom",
    legend.background = ggplot2::element_rect(fill = "black", color = "black"),
  )
}
