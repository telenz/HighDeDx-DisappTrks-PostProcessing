llvm-cxxcompiler             := llvm-cxxcompiler
ALL_TOOLS      += llvm-cxxcompiler
llvm-cxxcompiler_LOC_USE := gcc-cxxcompiler
llvm-cxxcompiler_EX_USE  := $(llvm-cxxcompiler_LOC_USE)
llvm-cxxcompiler_LOC_FLAGS_CXXFLAGS  := -Wno-c99-extensions -Wno-c++11-narrowing -D__STRICT_ANSI__ -Wno-unused-private-field -Wno-unknown-pragmas -Wno-unused-command-line-argument
llvm-cxxcompiler_EX_FLAGS_CXXFLAGS   := $(llvm-cxxcompiler_LOC_FLAGS_CXXFLAGS)
llvm-cxxcompiler_LOC_FLAGS_REM_CXXFLAGS  := -Wno-non-template-friend -Werror=format-contains-nul -Werror=maybe-uninitialized -Werror=unused-but-set-variable
llvm-cxxcompiler_EX_FLAGS_REM_CXXFLAGS   := $(llvm-cxxcompiler_LOC_FLAGS_REM_CXXFLAGS)
llvm-cxxcompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,llvm-cxxcompiler,,,llvm-cxxcompiler))

