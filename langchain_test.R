library(reticulate)

source("params.R")

llms = import("langchain_community.llms")
embeddings_import = import("langchain_community.embeddings")

llm = llms$Ollama(model = model)
embeddings = embeddings_import$OllamaEmbeddings(model = model)

llm$invoke("How much wood would a woodchuck chuck?")
