library(dplyr)
library(ggplot2)
library(kableExtra)

# Setando a pasta
setwd("~/Documents/projetos/projetos_r/curso_r/r_ciencia_dados_2/exercicio_curso-r_cd2")

# Para buscar a função
source("R/tema_starwars.R")

data <- dplyr::starwars

View(data)

######  EXERCICIO #######
# Faça um mini relatório com um gráfico mostrando a frequência das espécies 
# dos personagens do Star Wars. Use a base “starwars” do pacote dplyr. 
# Faça isso seguindo o modelo de organização de projetos visto na primeira aula.
######  #######  #######


# Salvar os dados como RDS
saveRDS(data, file = "data-raw/data_starwars.rds")
# Para carregar os dados usar o comando abaixo
# Fonte: http://www.sthda.com/english/wiki/saving-data-into-r-data-format-rds-and-rdata
#readRDS(file = "my_data.rds")

glimpse(data)

# Visualizar as espécies
data %>%
  mutate(
    species = if_else(is.na(species),"?Desconhecida?",species)
  ) %>%
  group_by(species) %>%
  summarise(qtd = n()) %>%
  mutate(freq = round(qtd / sum(qtd),2)) %>%
  arrange(desc(qtd)) %>%
  View()

# Conferir as seis espécies mais comuns
data %>%
  mutate(
    species = if_else(is.na(species),"?Desconhecida?",species)
  ) %>%
  group_by(species) %>%
  summarise(qtd = n()) %>%
  dplyr::mutate(perc = round(qtd / sum(qtd),2)) %>%
  arrange(desc(qtd)) %>%
  slice_max(qtd, n=6) %>% 
  kableExtra::kbl() %>%
  kableExtra::kable_styling()


# Quantidade de espécies diferentes
data %>%
  mutate(
    species = if_else(is.na(species),"?Desconhecida?", species)
  ) %>%
  summarise(esp_dif = n_distinct(species))


data %>%
  mutate(
    species = if_else(is.na(species),"?Desconhecida?",species)
  ) %>%
  group_by(species) %>%
  summarise(qtd = n()) %>%
  arrange(desc(qtd)) %>%
  slice_max(qtd, n=6) %>%
    ggplot2::ggplot(aes(x=reorder(species, -qtd), y=qtd, fill=as.factor(species),show.legend = FALSE)) +
    geom_col()+
    labs(title="Espécies mais frequentes",
         x="Espécies",
         y="Quantidade",
         fill="") +
    meu_tema_starwars() +
    theme(legend.position = "none", axis.text = element_text(angle=45))
