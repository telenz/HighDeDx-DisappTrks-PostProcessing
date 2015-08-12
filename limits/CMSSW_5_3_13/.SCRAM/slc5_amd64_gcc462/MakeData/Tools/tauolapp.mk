tauolapp             := tauolapp
ALL_TOOLS      += tauolapp
tauolapp_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tauolapp/1.1.1a-cms3/include /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tauolapp/1.1.1a-cms3/include/TauSpinner /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/tauolapp/1.1.1a-cms3/include/Tauola
tauolapp_EX_INCLUDE  := $(tauolapp_LOC_INCLUDE)
tauolapp_LOC_LIB := TauolaCxxInterface TauolaFortran TauolaTauSpinner
tauolapp_EX_LIB  := $(tauolapp_LOC_LIB)
tauolapp_LOC_USE := hepmc f77compiler
tauolapp_EX_USE  := $(tauolapp_LOC_USE)
tauolapp_INIT_FUNC := $$(eval $$(call ProductCommonVars,tauolapp,,,tauolapp))

