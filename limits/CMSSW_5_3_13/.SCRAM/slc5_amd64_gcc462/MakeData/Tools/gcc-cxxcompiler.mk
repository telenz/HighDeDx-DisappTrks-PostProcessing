gcc-cxxcompiler             := gcc-cxxcompiler
ALL_TOOLS      += gcc-cxxcompiler
gcc-cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS  := -shared -Wl,-E
gcc-cxxcompiler_EX_FLAGS_CXXSHAREDFLAGS   := $(gcc-cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS)
gcc-cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS  := -fPIC
gcc-cxxcompiler_EX_FLAGS_CXXSHAREDOBJECTFLAGS   := $(gcc-cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS)
gcc-cxxcompiler_LOC_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
gcc-cxxcompiler_EX_FLAGS_LDFLAGS   := $(gcc-cxxcompiler_LOC_FLAGS_LDFLAGS)
gcc-cxxcompiler_LOC_FLAGS_CPPDEFINES  := -DGNU_GCC -D_GNU_SOURCE
gcc-cxxcompiler_EX_FLAGS_CPPDEFINES   := $(gcc-cxxcompiler_LOC_FLAGS_CPPDEFINES)
gcc-cxxcompiler_LOC_FLAGS_CXXFLAGS  := -O2 -pedantic -ansi -pthread -pipe -Wno-vla -Werror=overflow -Wstrict-overflow -std=c++0x -msse3 -ftree-vectorize -Wno-strict-overflow -Werror=array-bounds -Werror=format-contains-nul -Werror=type-limits -fvisibility-inlines-hidden -felide-constructors -fmessage-length=0 -ftemplate-depth-300 -Wall -Wno-non-template-friend -Wno-long-long -Wreturn-type -Wunused -Wparentheses -Wno-deprecated -Werror=return-type -Werror=missing-braces -Werror=unused-value -Werror=address -Werror=format -Werror=sign-compare -Werror=write-strings -fdiagnostics-show-option
gcc-cxxcompiler_EX_FLAGS_CXXFLAGS   := $(gcc-cxxcompiler_LOC_FLAGS_CXXFLAGS)
gcc-cxxcompiler_LOC_FLAGS_LD_UNIT  := -r -m elf_x86_64
gcc-cxxcompiler_EX_FLAGS_LD_UNIT   := $(gcc-cxxcompiler_LOC_FLAGS_LD_UNIT)
gcc-cxxcompiler_INIT_FUNC := $$(eval $$(call ProductCommonVars,gcc-cxxcompiler,,,gcc-cxxcompiler))

