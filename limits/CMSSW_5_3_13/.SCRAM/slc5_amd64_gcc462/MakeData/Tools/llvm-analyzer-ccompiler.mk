llvm-analyzer-ccompiler             := llvm-analyzer-ccompiler
ALL_TOOLS      += llvm-analyzer-ccompiler
llvm-analyzer-ccompiler_LOC_USE := llvm-ccompiler
llvm-analyzer-ccompiler_EX_USE  := $(llvm-analyzer-ccompiler_LOC_USE)
llvm-analyzer-ccompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm-analyzer-ccompiler,,,llvm-analyzer-ccompiler))

