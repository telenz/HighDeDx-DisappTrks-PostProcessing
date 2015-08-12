pacparser             := pacparser
ALL_TOOLS      += pacparser
pacparser_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pacparser/1.3.1/include
pacparser_EX_INCLUDE  := $(pacparser_LOC_INCLUDE)
pacparser_LOC_LIB := pacparser
pacparser_EX_LIB  := $(pacparser_LOC_LIB)
pacparser_INIT_FUNC := $$(eval $$(call ProductCommonVars,pacparser,,,pacparser))

