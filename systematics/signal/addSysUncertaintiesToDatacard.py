#!/usr/bin/env/python

from decimal import Decimal
import sys

metCut    = sys.argv[1]
ptCut     = sys.argv[2]
ecaloCut  = sys.argv[3]
iasCut    = float(sys.argv[4])*100
mass      = sys.argv[5]
ctau      = sys.argv[6]


fIn = open('../bkg/datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f_mass_%sGeV_ctau_%scm.txt' %(metCut,ptCut,ecaloCut,iasCut,mass,ctau), 'r')
linesOriginal = fIn.read().split("\n")

# Write old stuff to datacard
fout = open('datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f_mass_' %(metCut,ptCut,ecaloCut,iasCut) + str(mass) + 'GeV_ctau_' + str(ctau) + 'cm.txt', 'w')
for line in linesOriginal:
    fout.write(line)
    fout.write('\n')
####################################################################################################
# Add new stuff - 1_luminosity
fIn = open('1_Luminosity/logFiles/uncertainty.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):
    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)
        
format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"

fout.write(format_string.format("lumi", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 2_ISR
fIn = open('2_ISR/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):
    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("ISR", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 3_TriggerEfficiency
fIn = open('3_TriggerEfficiency/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):
    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("trigger", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 4_JetEnergyScale
fIn = open('4_JetEnergyScale/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):
    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("JES", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 5_JetEnergyResolution
fIn = open('5_JetEnergyResolution/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("JER", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 6_PDF
fIn = open('6_PDF/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("PDF", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 7_Ecalo
fIn = open('7_Ecalo/logFiles/uncertainty.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("ECalo", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 8_NInnerMiddleLost
fIn = open('8_NInnerMiddleLost/logFiles/uncertainty_Middle.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("HitsLostMiddle", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 8_NInnerMiddleLost
fIn = open('8_NInnerMiddleLost/logFiles/uncertainty_Inner.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("HitsLostInner", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 9_Pileup
fIn = open('9_Pileup/logFiles/Madgraph_signal_mass_' + str(mass) + '_ctau_' + str(ctau) + 'cm.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("PU", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 10_TrkRecoEff
fIn = open('10_TrkRecoEff/logFiles/result_ptCutEq' +str(ptCut) + '.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("TrkRecoEff", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 11_Ias
fIn = open('11_Ias/logFiles/uncertainty.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("Ias", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')

# Add new stuff - 12_xsec
fIn = open('12_xsec/logFiles/Madgraph_signal_mass_' + str(mass) + '.log','r')
lines = fIn.read().split("\n")

for n in range(len(lines)):

    if lines[n].find('Final Uncertainty ') >= 0:
        uncertainty = float(lines[n].split(' = ')[1]) + 1
        print 'uncertainty = ' + str(uncertainty)

fout.write(format_string.format("xsec", "lnN", "", uncertainty,"-", "-","-", "-"))
fout.write('\n')
####################################################################################################
