#include "TROOT.h"
#include "TFile.h"
#include "TProfile.h"
#include "TH1.h"
#include "TH2.h"
#include "TMath.h"
#include "TGraph.h"
#include "TGraphErrors.h"
#include "TString.h"
#include "TCanvas.h"
#include "TLegend.h"
#include "TLatex.h"
#include "TROOT.h"
#include "TStyle.h"
#include "TLine.h"
#include "TTree.h"
#include "TChain.h"
#include "TRandom3.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <iomanip>
#include "../../../plotStyle.h"



int getSysUncertainty(double ptCut, double ecaloCut, double iasCut){

  TString particle = "";

  // %%%%%%%%%%  Uncertainty of PDF  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  TString filename =  Form("/afs/desy.de/user/t/tlenz/xxl-af-cms/PDFANALYSIS/workdir/analysis_2015_07_17_ptGt%.0f_ecaloLe%.0f_iasGt0p%02.0f/results/analyzer/ntuples/input_weighted/Madgraph_signal_mass_200_ctau_10cm.root",ptCut,ecaloCut,iasCut*100);
  TFile *file      =  new TFile(filename,"READ");
  //TFile *file     =  new TFile("analyzer_histograms_full.root","READ");
  TH1D *hpdf      =  0;
  file            -> GetObject("nEvents_PDF",hpdf);

  double N_90     = 1.64485;

  double sumUp   = 0;
  double sumDown = 0;

  for(int i=1; i<(hpdf->GetNbinsX()-1)/2.; i++){


    sumUp   += pow( TMath::Max( hpdf->GetBinContent(2*i) - hpdf->GetBinContent(1)    , hpdf->GetBinContent(2*i+1) - hpdf->GetBinContent(1)     ) , 2);
    sumDown += pow( TMath::Max( hpdf->GetBinContent(1)   - hpdf->GetBinContent(2*i)  , hpdf->GetBinContent(1)     - hpdf->GetBinContent(2*i+1) ) , 2);


  }

  // sigma in number of events
  N_90 = 1;
  sumUp   = 1./N_90* sqrt(sumUp);
  sumDown = 1./N_90* sqrt(sumDown);


  // relative difference
  double upUnc   = sumUp/hpdf->GetBinContent(1);
  double downUnc = sumDown/hpdf->GetBinContent(1);


  cout<<"###########################################################################"<<endl;
  cout.precision(3);


  cout<<fixed<<"upward uncertainty     = "<<upUnc*100<<" %\\\\"<<endl;
  cout<<fixed<<"downward uncertainty   = "<<downUnc*100<<" %\\\\"<<endl;

  cout.precision(3);
  double uncertainty = (upUnc+downUnc)/2.;
  cout<<"Final Uncertainty = "<<fixed<<uncertainty<<endl;
  cout<<"###########################################################################"<<endl;

  return 0;
 
}

//################################################################################################################################
//################################################################################################################################
