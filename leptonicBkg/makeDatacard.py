#!/usr/bin/env/python

from decimal import Decimal
import sys

print sys.argv[1]
print sys.argv[2]
print sys.argv[3]
print sys.argv[4]

metCut    = sys.argv[1]
ptCut     = sys.argv[2]
ecaloCut  = sys.argv[3]
iasCut    = float(sys.argv[4])*100
print iasCut

iasCutS=str(iasCut)
if(float(iasCut)<10):
    iasCutS="05"

f = open('datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f.txt' %(metCut,ptCut,ecaloCut,iasCut) , 'w')


# Get results from file results.log
fIn = open('logFiles/results.log', 'read')
lines = fIn.read().split("\n")

for line in lines:

    if line.find('Fake') >= 0:
        fakeBkg     = "{0:.4f}".format(float(line.split()[3]))
        fakeBkgErr  = "{0:.4f}".format(float(line.split()[5]))
    if line.find('Pion') >= 0:
        pionBkg     =  "{0:.4f}".format(float(line.split()[3]))
    if line.find('Electron') >= 0:
        elecBkg     =  "{0:.4f}".format(float(line.split()[3]))
    if line.find('Muon') >= 0:
        muonBkg     =  "{0:.4f}".format(float(line.split()[3]))
    if line.find('Data Yield') >= 0:
        aux  =  line.split(" = ")[1]
        aux = aux[0:-2]
        dataYield = float(aux)
        print dataYield

f.write('imax 1 number of channels \n')
f.write('jmax 4 number of backgrounds \n')
f.write('kmax * number of nuisance parameters \n\n\n')
f.write('----------------------------------------\n')
f.write('bin                                    1\n')
f.write('observation                            ' + str("{0:.0f}".format(dataYield)) + '\n')
f.write('----------------------------------------\n\n\n')


# signal
list     = ['bin','process','process','rate']
listErr  = ['','','','']
listN    = ['','','','']
list0    = ['1','CharginoPair_mass_100GeV_ctau_5cm', 0, 'x.xxxx']
list1    = ['1','Fake', 1, fakeBkg]
list2    = ['1','Pion', 1, pionBkg]
list3    = ['1','Elec', 1, elecBkg]
list4    = ['1','Muon', 1, muonBkg]



format_string = "{0:<40}{1:<5}{2:<10}{3:<40}{4:<30}{5:<30}{6:<30}{7:<30}"
for n in range(len(list0)):
    f.write(format_string.format(list[n], listErr[n], listN[n], list0[n], list1[n], list2[n], list3[n], list4[n]))
    f.write('\n')


# Get n events from lepton.log
fIn = open('logFiles/pion.log', 'read')
lines = fIn.read().split("\n")
for line in lines:
    if line.find('Signal region') >= 0:
        nPionSR      = line.split()[3]
    if line.find('Control region') >= 0:
        nPionCR      = line.split()[3]
    if line.find('Data Yield') >= 0:
        nPionCRData  = line.split()[4]
    if line.find('NEntries in high Ias =') >=0:
        nPionHighIas         = line.split()[5]
    if line.find('NEntries in Ias histo  =') >= 0:
        nPionIas  = line.split()[5]
        print "nPionIas = " + str(nPionIas)
fIn = open('logFiles/elec.log', 'read')
lines = fIn.read().split("\n")
for line in lines:
    if line.find('Signal region') >= 0:
        nElecSR  = line.split()[3]
    if line.find('Control region') >= 0:
        nElecCR      = line.split()[3]
    if line.find('Data Yield') >= 0:
        nElecCRData  = line.split()[4]
    if line.find('NEntries in high Ias =') >=0:
        nElecHighIas         = line.split()[5]
        #if(float(nIas)==0):
        #     nElecSR=0;
    if line.find('NEntries in Ias histo  =') >= 0:
        nElecIas             = line.split()[5]
fIn = open('logFiles/muon.log', 'read')
lines = fIn.read().split("\n")
for line in lines:
    if line.find('Signal region') >= 0:
        nMuonSR  = line.split()[3]
    if line.find('Control region') >= 0:
        nMuonCR      = line.split()[3]
    if line.find('Data Yield') >= 0:
        nMuonCRData  = line.split()[4]
    if line.find('NEntries in high Ias =') >=0:
        nMuonHighIas         = line.split()[5]
    if line.find('NEntries in Ias histo  =') >= 0:
        nMuonIas  = line.split()[5]


fakeError  = "{0:.4f}".format(float(fakeBkgErr)/float(fakeBkg)+1.)

# Case 1) nIasPion is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^high_ias/n_MC^all_ias   
if(float(nPionHighIas)==0):
    scale_pion = "{0:.4f}".format(float(nPionCRData)/float(nPionCR)*float(nPionSR)*1./float(nPionIas))
    if(nPionSR==0):
        print "ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR"
    nPionSR=0
# Case 2) nIasPion is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^veto* 1/n_MC^all_ias   
else:
    scale_pion = "{0:.4f}".format(float(nPionCRData)/float(nPionCR)*float(nPionHighIas)/float(nPionIas))    
# Case 1) nIasElec is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^high_ias/n_MC^all_ias   
if(float(nElecHighIas)==0):
    scale_elec = "{0:.4f}".format(float(nElecCRData)/float(nElecCR)*float(nElecSR)*1./float(nElecIas))
    if(nElecSR==0):
        print "ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR"
    nElecSR=0
# Case 2) nIasElec is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^veto* 1/n_MC^all_ias   
else:
    scale_elec = "{0:.4f}".format(float(nElecCRData)/float(nElecCR)*float(nElecHighIas)/float(nElecIas))
# Case 1) nIasMuon is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^high_ias/n_MC^all_ias   
if(float(nMuonHighIas)==0):
    scale_muon = "{0:.4f}".format(float(nMuonCRData)/float(nMuonCR)*float(nMuonSR)*1./float(nMuonIas))
    if(nMuonSR==0):
        print "ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR"
    nMuonSR=0
# Case 2) nIasMuon is not zero -> then scaling factor is: n_data^vetoInv/n_MC^vetoInv* n_MC^veto* 1/n_MC^all_ias   
else:
    scale_muon = "{0:.4f}".format(float(nMuonCRData)/float(nMuonCR)*float(nMuonHighIas)/float(nMuonIas))


   

f.write('\n\n')
f.write('# STATISTICAL UNCERTAINTIES\n\n')

list     = ['signal_stat', 'fake_stat', 'pion_stat', 'elec_stat', 'muon_stat']
listErr  = ['gmN'        , 'lnN'      , 'gmN'      , 'gmN'      , 'gmN'      ]
listN    = ['x'          , ' '        , nPionSR    , nElecSR    , nMuonSR    ]
list0    = ['x.xxxx'     , '-        ', '-        ', '-        ', '-        ']
list1    = ['-'          , fakeError  , '-        ', '-        ', '-        ']
list2    = ['-'          , '-        ', scale_pion , '-        ', '-        ']
list3    = ['-'          , '-        ', '-        ', scale_elec , '-        ']
list4    = ['-'          , '-        ', '-        ', '-        ', scale_muon ]

for n in range(len(list0)):
    f.write(format_string.format(list[n], listErr[n], listN[n], list0[n], list1[n], list2[n], list3[n], list4[n]))
    f.write('\n')
