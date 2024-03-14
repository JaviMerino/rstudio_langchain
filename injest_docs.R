library(reticulate)

source("params.R")

# Import langchain objects
document_loaders = import("langchain_community.document_loaders")
text_splitter = import("langchain.text_splitter")
embeddings_import = import("langchain_community.embeddings")
vectorstores = import("langchain_community.vectorstores")
PyPDFDirectoryLoader = document_loaders$PyPDFDirectoryLoader
doc_splitter = text_splitter$RecursiveCharacterTextSplitter()
embeddings = embeddings_import$OllamaEmbeddings(model=model)
Chroma = vectorstores$Chroma

my_docs = PyPDFDirectoryLoader('docs/')
docs_pages = my_docs$load()

docs_splitted = doc_splitter$split_documents(docs_pages)
vectordb = Chroma$from_documents(
  documents = docs_splitted,
  embedding = embeddings,
  persist_directory = chromadb_file
)
