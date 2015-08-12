gcc-f77compiler             := gcc-f77compiler
ALL_TOOLS      += gcc-f77compiler
gcc-f77compiler_LOC_LIB := gfortran m
gcc-f77compiler_EX_LIB  := $(gcc-f77compiler_LOC_LIB)
gcc-f77compiler_LOC_FLAGS_FFLAGS  := -fno-second-underscore -Wunused -Wuninitialized -O2 -cpp
gcc-f77compiler_EX_FLAGS_FFLAGS   := $(gcc-f77compiler_LOC_FLAGS_FFLAGS)
gcc-f77compiler_LOC_FLAGS_FOPTIMISEDFLAGS  := -O2
gcc-f77compiler_EX_FLAGS_FOPTIMISEDFLAGS   := $(gcc-f77compiler_LOC_FLAGS_FOPTIMISEDFLAGS)
gcc-f77compiler_LOC_FLAGS_FSHAREDOBJECTFLAGS  := -fPIC
gcc-f77compiler_EX_FLAGS_FSHAREDOBJECTFLAGS   := $(gcc-f77compiler_LOC_FLAGS_FSHAREDOBJECTFLAGS)
gcc-f77compiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,gcc-f77compiler,,,gcc-f77compiler))

