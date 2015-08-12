pythia8-175             := pythia8-175
ALL_TOOLS      += pythia8-175
pythia8-175_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/pythia8-175/175/include
pythia8-175_EX_INCLUDE  := $(pythia8-175_LOC_INCLUDE)
pythia8-175_LOC_LIB := pythia8 hepmcinterface
pythia8-175_EX_LIB  := $(pythia8-175_LOC_LIB)
pythia8-175_LOC_USE := hepmc pythia6 clhep lhapdf
pythia8-175_EX_USE  := $(pythia8-175_LOC_USE)
pythia8-175_INIT_FUNC := $$(eval $$(call ProductCommonVars,pythia8-175,,,pythia8-175))

