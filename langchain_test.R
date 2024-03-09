library(reticulate)

llms = import("langchain_community.llms")
Ollama = llms$Ollama
llm = Ollama(model = "mistral")

llm$invoke("How much wood would a woodchuck chuck?")
