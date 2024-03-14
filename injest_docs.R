library(reticulate)

source("params.R")

# Import langchain objects
document_loaders = import("langchain_community.document_loaders")
text_splitter = import("langchain.text_splitter")
embeddings_import = import("langchain_community.embeddings")
vectorstores = import("langchain_community.vectorstores")
PyPDFLoader = document_loaders$PyPDFLoader
doc_splitter = text_splitter$RecursiveCharacterTextSplitter()
embeddings = embeddings_import$OllamaEmbeddings(model=model)
Chroma = vectorstores$Chroma

# TODO Generalize to all PDFs in the docs folder
my_doc = PyPDFLoader('docs/ggplot2.pdf')
doc_pages = my_doc$load()

doc_splitted = doc_splitter$split_documents(doc_pages)
vectordb = Chroma$from_documents(
  documents = doc_splitted,
  embedding = embeddings,
  persist_directory = chromadb_file
)
