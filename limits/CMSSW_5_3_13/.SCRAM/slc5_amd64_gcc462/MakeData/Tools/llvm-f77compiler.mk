llvm-f77compiler             := llvm-f77compiler
ALL_TOOLS      += llvm-f77compiler
llvm-f77compiler_LOC_USE := gcc-f77compiler
llvm-f77compiler_EX_USE  := $(llvm-f77compiler_LOC_USE)
llvm-f77compiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm-f77compiler,,,llvm-f77compiler))

