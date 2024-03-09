from langchain_community.llms import Ollama
llm = Ollama(model="mistral")

def run_llm(query):
  return llm.invoke(query)
