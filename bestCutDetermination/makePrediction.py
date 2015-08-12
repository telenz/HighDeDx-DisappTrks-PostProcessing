#!/usr/bin/env/python

from decimal import Decimal
import sys
import math
import ROOT
import os.path

#metCut    = sys.argv[1]
#ptCut     = sys.argv[2]
#ecaloCut  = sys.argv[3]
#iasCut    = float(sys.argv[4])*100
#ptCut=20
#iasCut=15
#mass=500
#ctau=5
mass=100
ctau=1



##############################################################################################
def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False
##############################################################################################
def getOneSidedUpperLimit(mu, cl):
    muUp = 1./2.*ROOT.TMath.ChisquareQuantile(cl,2.*(mu+1));
    return muUp;
def getOneSidedLowerLimit(mu, cl):
    muLow = 1./2.*ROOT.TMath.ChisquareQuantile(1-cl,2.*mu);
    return muLow;
#################################### function definition ####################################
def getYield(filename, type ):
    fileIn = open(filename,'r')
    lines = fileIn.read().split("\n")
    if type == "signal": column=1
    elif type == "fake": column=2
    elif type == "pion": column=3
    elif type == "elec": column=4
    elif type == "muon": column=5
    for n in range(len(lines)):
        if lines[n].find('rate') >= 0:
            columns = lines[n].split()
            #print columns
            break
    return float(columns[column])
##############################################################################################
def getStatUncertainties(filename):
  uncertaintyUp=0
  uncertaintyDown=0
  lines = open(filename,'r').readlines()[10:-1]
  for type in ['fake','pion','elec','muon']:
    for n in range(len(lines)):
      if lines[n].find(type + '_stat') >= 0:
        if lines[n].find('lnN') >= 0:
          aux = lines[n].split("lnN")[1]
          columns = aux.split()
          for i in range(len(columns)):
            if isfloat(columns[i]):
              uncertaintyUp   = uncertaintyUp+pow((float(columns[i])-1)*getYield(filename,type),2)
              uncertaintyDown = uncertaintyDown+pow((float(columns[i])-1)*getYield(filename,type),2)
        if lines[n].find('gmN') >= 0:
          aux = lines[n].split("gmN")[1]
          columns = aux.split()
          nEvents = float(columns[0])
          statUncUp   = getOneSidedUpperLimit(nEvents,0.6827)-nEvents
          statUncDown = nEvents-getOneSidedLowerLimit(nEvents,0.6827)
          columns = columns[1:]
          for i in range(len(columns)):
            if isfloat(columns[i]):
              uncertaintyUp   = uncertaintyUp+pow(float(columns[i])*statUncUp,2)
              uncertaintyDown = uncertaintyDown+pow(float(columns[i])*statUncDown,2)
            
  return (math.sqrt(uncertaintyUp), math.sqrt(uncertaintyDown))
##############################################################################################
def getSysUncertainties(filename):
  uncertainty=0
  lines = open(filename,'r').readlines()[10:-1]
  for n in range(len(lines)):
    for type in ['fake','pion','elec','muon']:
      if lines[n].find(type + '_syst') >= 0:
        aux = lines[n].split("lnN")[1]
        columns = aux.split()
        for i in range(len(columns)):
          if isfloat(columns[i]):
            print "getYield(filename,type) = " + str(getYield(filename,type))
            print "(float(columns[i])-1) = " + str((float(columns[i])-1))
            uncertainty = uncertainty+pow((float(columns[i])-1)*getYield(filename,type),2)
            print uncertainty
  return math.sqrt(uncertainty)
##############################################################################################
def getSignalUncertainties(filename):
    uncertainty=0
    lines = open(filename,'r').readlines()[38:]
    for n in range(len(lines)):
        if lines[n].find('xsec') >= 0: continue
        aux = lines[n].split("lnN")[1]
        columns = aux.split()
        for i in range(len(columns)):
            if isfloat(columns[i]):
                uncertainty = uncertainty+pow((float(columns[i])-1)*getYield(filename,"signal"),2)
                #print "uncertainty lnN = " + str(uncertainty)
    return math.sqrt(uncertainty)
##############################################################################################

ptCut=50
iasCut=30
file    = 'datacards/datacard_metCutEq%s_ptCutEq%s_ECaloCutEq%s_IasCutEq0p%02.0f_mass_' %(100,ptCut,5,iasCut) + str(mass) + 'GeV_ctau_' + str(ctau) + 'cm.txt'
nSignal = getYield(file,"signal")
nFake   = getYield(file,"fake")
nPion   = getYield(file,"pion")
nElec   = getYield(file,"elec")
nMuon   = getYield(file,"muon")
nBkg    = nFake + nPion + nElec + nMuon  


statUncUp,statUncDown = getStatUncertainties(file)
print "statUncUp = " + str(statUncUp)
print "statUncDown = " + str(statUncDown)
sysUnc=getSysUncertainties(file)
print "sysUnc = " + str(sysUnc)
signalUnc = getSignalUncertainties(file)

print "Result (pt>" + str(ptCut) +"GeV, Ias>0." + str(iasCut) + ") = " +str(nBkg)+ " + " +"{0:.3f}".format(statUncUp) + " - "+ "{0:.3f}".format(statUncDown)+ " (stat)" + " +/- " + "{0:.3f}".format(sysUnc)+ " (sys)" 


#format_string = "{0:<30}{1:<30}{2:<30}{3:<30}{4:<30}{5:<30}"
#if printTitle=="1":
#    print format_string.format("mass [GeV]", "lifetime [cm]", "optimal pt Cut", "optimal Ias Cut","min. excluded xsection [pb]" ,"actual xsection [pb]")
#    fileOut.write(format_string.format("mass [GeV]", "lifetime [cm]", "optimal pt Cut", "optimal Ias Cut","min. excluded xsection [pb]" ,"actual xsection [pb]"))
#    fileOut.write("\n")
#print format_string.format(mass, ctau, bestValuePtCut, "0." + str(bestValueIasCut),"{0:.4f}".format(bestValueXsec) ,"{0:.4f}".format(xsec))
#fileOut.write(format_string.format(mass, ctau, bestValuePtCut, "0." + str(bestValueIasCut),"{0:.4f}".format(bestValueXsec) ,"{0:.4f}".format(xsec)))
#fileOut.write("\n")
#print "best pt cut = " + str(bestValuePtCut)
#print "best ias cut = " + str(bestValueIasCut)     
#print "excluded xsec = " + str(bestValueXsec)
#print "xsec = " + str(xsec)
#print " "
