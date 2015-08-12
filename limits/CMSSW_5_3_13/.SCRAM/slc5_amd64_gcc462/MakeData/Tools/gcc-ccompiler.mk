gcc-ccompiler             := gcc-ccompiler
ALL_TOOLS      += gcc-ccompiler
gcc-ccompiler_LOC_FLAGS_CFLAGS  := -O2 -pthread
gcc-ccompiler_EX_FLAGS_CFLAGS   := $(gcc-ccompiler_LOC_FLAGS_CFLAGS)
gcc-ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS  := -fPIC
gcc-ccompiler_EX_FLAGS_CSHAREDOBJECTFLAGS   := $(gcc-ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS)
gcc-ccompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,gcc-ccompiler,,,gcc-ccompiler))

