library("oposSOM")

setwd('D:/git_repos/zebrafishCardioSOM/')
rld_for_SOM_carido <- readRDS(file = "rld_for_SOM_carido.RDS")

#Set preferences
env_cardio <-
  opossom.new(
    list(
      dataset.name = "cardio_SOM", #name of dataset to be created
      dim.1stLvlSom = 40, #som size based on sample number and gene number
      training.extension = 2,
      database.dataset = "drerio_gene_ensembl",
      database.id.type = "ensembl_gene_id"
    )
  )

rld_som <- data.matrix(rld_for_SOM_carido, rownames.force = NA)
colnames(rld_som) <-
  c(
    "24hpf_neg",
    "24hpf_pos",
    "24hpf_pos",
    "48hpf_neg",
    "48hpf_pos",
    "48hpf_pos",
    "72hpf_neg",
    "72hpf_pos",
    "72hpf_pos",
    "72hpf_neg_gata5",
    "72hpf_pos_gata5",
    "72hpf_pos_gata5",
    "72hpf_neg_tbx5",
    "72hpf_pos_tbx5",
    "72hpf_pos_tbx5",
    "72hpf_neg_hand2",
    "72hpf_pos_hand2",
    "72hpf_pos_hand2"
  )

#Load input data
env_cardio$indata <- rld_som

#Define sample groups and labels
env_cardio$group.labels <- colnames(rld_som)

env_cardio$group.colors <-
  c(
    "grey",
    "green",
    "green",
    "black",
    "blue",
    "blue",
    "brown",
    "red",
    "red",
    "violet",
    "pink",
    "pink",
    "yellow",
    "gold",
    "gold",
    "rosy brown",
    "darkblue",
    "darkblue"
  )

#execute som (may take some time)
opossom.run(env_cardio)