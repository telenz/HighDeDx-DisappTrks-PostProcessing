llvm-analyzer-cxxcompiler             := llvm-analyzer-cxxcompiler
ALL_TOOLS      += llvm-analyzer-cxxcompiler
llvm-analyzer-cxxcompiler_LOC_USE := llvm-cxxcompiler
llvm-analyzer-cxxcompiler_EX_USE  := $(llvm-analyzer-cxxcompiler_LOC_USE)
llvm-analyzer-cxxcompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm-analyzer-cxxcompiler,,,llvm-analyzer-cxxcompiler))

