ifeq ($(strip $(HiggsAnalysis-CombinedLimit/bin)),)
src_HiggsAnalysis-CombinedLimit_bin := self/HiggsAnalysis-CombinedLimit/bin
HiggsAnalysis-CombinedLimit/bin  := src_HiggsAnalysis-CombinedLimit_bin
src_HiggsAnalysis-CombinedLimit_bin_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis-CombinedLimit/bin/BuildFile
src_HiggsAnalysis-CombinedLimit_bin_EX_USE := self
ALL_EXTERNAL_PRODS += src_HiggsAnalysis-CombinedLimit_bin
src_HiggsAnalysis-CombinedLimit_bin_INIT_FUNC += $$(eval $$(call EmptyPackage,src_HiggsAnalysis-CombinedLimit_bin,src/HiggsAnalysis-CombinedLimit/bin))
endif

