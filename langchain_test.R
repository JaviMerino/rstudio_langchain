library(reticulate)

importlib <- import("importlib")


my_script = import("my_script")
# Annoying, but to force reticulate to reload my python modules
importlib$reload(my_script)

my_script$run_llm("How much wood would a woodchuck chuck?")
