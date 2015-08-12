cgal             := cgal
ALL_TOOLS      += cgal
cgal_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc462/external/cgal/4.2/include
cgal_EX_INCLUDE  := $(cgal_LOC_INCLUDE)
cgal_LOC_LIB := CGAL_Core CGAL
cgal_EX_LIB  := $(cgal_LOC_LIB)
cgal_LOC_USE := zlib boost_system
cgal_EX_USE  := $(cgal_LOC_USE)
cgal_INIT_FUNC := $$(eval $$(call ProductCommonVars,cgal,,,cgal))

