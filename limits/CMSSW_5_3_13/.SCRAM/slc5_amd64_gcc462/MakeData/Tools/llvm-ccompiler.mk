llvm-ccompiler             := llvm-ccompiler
ALL_TOOLS      += llvm-ccompiler
llvm-ccompiler_LOC_USE := gcc-ccompiler
llvm-ccompiler_EX_USE  := $(llvm-ccompiler_LOC_USE)
llvm-ccompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm-ccompiler,,,llvm-ccompiler))

