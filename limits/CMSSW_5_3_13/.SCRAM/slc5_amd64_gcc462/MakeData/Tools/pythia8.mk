pythia8             := pythia8
ALL_TOOLS      += pythia8
pythia8_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pythia8/153-cms5/include
pythia8_EX_INCLUDE  := $(pythia8_LOC_INCLUDE)
pythia8_LOC_LIB := pythia8_153 hepmcinterface_153
pythia8_EX_LIB  := $(pythia8_LOC_LIB)
pythia8_LOC_USE := hepmc pythia6 clhep lhapdf
pythia8_EX_USE  := $(pythia8_LOC_USE)
pythia8_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia8,,,pythia8))

