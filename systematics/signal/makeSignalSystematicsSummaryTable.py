#!/usr/bin/env/python

from decimal import Decimal
import sys
import glob

fout = open('signalSystematicsOverview.txt', 'w')
fout.write("Summary table of all systematic uncertainties")
fout.write('\n\n')
format_string = "{0:<40}{1:<20}{2:<20}"
fout.write(format_string.format("Uncertainty","Min","Max"))
fout.write('\n')
format_string = "{0:<40}{1:<20}{2:<20}"

##########################################################################################################################################################################################
#2.) ISR
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('ISR') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("ISR",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#3.) Trigger
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('trigger') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("Trigger efficiency",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#4.) JES
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('JES') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("JES",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#5.) JER
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('JER') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("JER",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#6.) PDF
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('PDF') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("PDF",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#7.) Ecalo
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('ECalo') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("E_calo efficiency",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#8.) Lost middle hits
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('HitsLostMiddle') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("n_lost^middle eff",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#9.) Lost inner hits
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('HitsLostInner') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("n_lost^inner eff",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#10.) PU
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('PU') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("PU",round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#11.) TrkRecoEff
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('TrkRecoEff') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("track reconstruction efficiency", round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#12.) Ias
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('Ias') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("Ias", round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
##########################################################################################################################################################################################
#13.) xsec
uncertaintyMax = 0
uncertaintyMin = 10000
for filename in glob.iglob('datacards/*.txt'):
     print filename
     fIn   = open(filename, 'r')
     lines = fIn.read().split("\n")
     for n in range(len(lines)):
         if lines[n].find('xsec') >= 0:
             aux = lines[n].split('lnN')[1]
             uncertaintyAux = float(aux.split(' - ')[0]) -1.
             if(float(uncertaintyAux) > float(uncertaintyMax)):
                 uncertaintyMax = uncertaintyAux
             if(float(uncertaintyAux) < float(uncertaintyMin)):
                 uncertaintyMin = uncertaintyAux
             print uncertaintyMin    
fout.write(format_string.format("xsec", round(float(uncertaintyMin*100),1) , round(float(uncertaintyMax*100)) ))
fout.write('\n')
