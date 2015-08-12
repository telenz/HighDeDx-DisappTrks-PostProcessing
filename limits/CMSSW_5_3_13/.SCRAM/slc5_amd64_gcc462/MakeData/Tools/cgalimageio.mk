cgalimageio             := cgalimageio
ALL_TOOLS      += cgalimageio
cgalimageio_LOC_LIB := CGAL_ImageIO
cgalimageio_EX_LIB  := $(cgalimageio_LOC_LIB)
cgalimageio_LOC_USE := zlib boost_system cgal
cgalimageio_EX_USE  := $(cgalimageio_LOC_USE)
cgalimageio_INIT_FUNC := $$(eval $$(call ProductCommonVars,cgalimageio,,,cgalimageio))

