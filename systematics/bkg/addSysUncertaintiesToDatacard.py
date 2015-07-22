#!/usr/bin/env/python

from decimal import Decimal
import sys

metCut    = sys.argv[1]
ptCut     = sys.argv[2]
ecaloCut  = sys.argv[3]
iasCut    = float(sys.argv[4])*100
mass      = sys.argv[5]
ctau      = sys.argv[6]


fIn = open('../../signal/datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f_mass_%sGeV_ctau_%scm.txt' %(metCut,ptCut,ecaloCut,iasCut,mass,ctau), 'r')
linesOriginal = fIn.read().split("\n")

# Write old stuff to datacard
fout = open('datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f_mass_' %(metCut,ptCut,ecaloCut,iasCut) + str(mass) + 'GeV_ctau_' + str(ctau) + 'cm.txt', 'w')
for line in linesOriginal:
    fout.write(line)
    fout.write('\n')


# Add new stuff - pions
fIn = open('1_LeptonScaleFactors/pion.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
fout.write("\n# SYSTEMATIC UNCERTAINTIES \n\n")

format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"

fout.write(format_string.format("pion_syst_rate", "lnN", "", "-", "-", uncertainty,"-", "-"))
fout.write('\n')

# Add new stuff - electrons
fIn = open('1_LeptonScaleFactors/electron_ptCutEq%s_ecaloCutEq%s.log' %(ptCut,ecaloCut),'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("elec_syst_rate", "lnN", "", "-", "-", "-",uncertainty, "-"))
fout.write('\n')

# Add new stuff - muons
fIn = open('1_LeptonScaleFactors/muon_ecaloCutEq%s.log' %(ecaloCut) ,'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1.
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("muon_syst_rate", "lnN", "", "-","-", "-", "-", uncertainty))
fout.write('\n')

####################################################################################################
# Add new stuff - pions
fIn = open('2_LeptonIas/pion_ptCutEq%s_iasCutEq0p%.0f.log' %(ptCut,iasCut),'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        

format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("pion_syst_ias", "lnN", "", "-", "-", uncertainty,"-", "-"))
fout.write('\n')

# Add new stuff - electrons
fIn = open('2_LeptonIas/electron_ptCutEq%s_iasCutEq0p%.0f.log' %(ptCut,iasCut),'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("elec_syst_ias", "lnN", "", "-", "-", "-",uncertainty, "-"))
fout.write('\n')

# Add new stuff - muons
fIn = open('2_LeptonIas/muon_ptCutEq%s_iasCutEq0p%.0f.log' %(ptCut,iasCut) ,'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("muon_syst_ias", "lnN", "", "-","-", "-", "-", uncertainty))
fout.write('\n')

####################################################################################################
# Add new stuff - fake rate
fIn = open('3_FakeRate/fake_ptCutEq%s_ecaloCutEq%s.log' %(ptCut,ecaloCut) ,'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("fake_syst_rate", "lnN", "", "-", uncertainty,"-", "-", "-"))
fout.write('\n')
####################################################################################################
# Add new stuff - fake ias
fIn = open('4_FakeIas/fake_ptCutEq%s_ecaloCutEq%s_iasCutEq0p%.0f.log' %(ptCut,ecaloCut,iasCut) ,'r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
fout.write(format_string.format("fake_syst_ias", "lnN", "", "-", uncertainty,"-", "-", "-"))
fout.write('\n')
####################################################################################################
