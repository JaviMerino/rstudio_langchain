library(reticulate)

source("params.R")

embeddings_import = import("langchain_community.embeddings")
vectorstores = import("langchain_community.vectorstores")
ollama = import("ollama")

embeddings = embeddings_import$OllamaEmbeddings(model = model)
vectordb = vectorstores$Chroma(persist_directory=chromadb_file,
                  embedding_function=embeddings)

ask_question <- function(query, k=4L) {
  vectordb_results = vectordb$similarity_search(query, k)
  results_content = sapply(vectordb_results, function(e) e$page_content)
  context = paste(results_content, collapse="\n")
  prompt = sprintf("Given the following context:\n%s\n%s", context, query)
  response = ollama$generate(model=model, prompt=prompt)
  return (response$response)
}

cat(ask_question("How is COPD exacerbation defined?"))
