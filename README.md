Playground to try something like:

https://www.infoworld.com/article/3703249/generative-ai-with-langchain-rstudio-and-just-enough-python.html

## Installation

### Nix
Run RStudio with `nix run`

### Linux or MacOS
1. Install R and RStudio
2. Install reticulate
  * RStudio should prompt you
3. In the r-reticulate virtualenv, install langchain, pypdf and chromadb
  * In R: `virtualenv_install(envname='r-reticulate', packages=c('langchain', 'pypdf', 'chromadb'))`
  * Otherwise, using pip, the virtualenv is in `~/.virtualenvs/r-reticulate`

## Usage

### Document injestion
Put your PDFs in the `docs/` folder.  For example, you can use the ggplot2 PDF: https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf

In a terminal, run `ollama serve`

Run the `injest_docs.R` script to generate the chromadb

### Query
Run the `langchain_test.R` script.  Change the query as needed.

## See also
* https://python.langchain.com/docs/get_started/quickstart
