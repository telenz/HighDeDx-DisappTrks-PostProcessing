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
#include "../../../inputAnalysisFiles.h"


class sample{


public:

  TFile *file;
  TTree *tree;

  TH1D* histo;
  TH1D* histoASmiSR;
  TH1D* histoNValidSR;
  TH1D* histoECalo;
  TH1D* histoPt;

  double statistics;
  double purity;

  vector<double> *trackEta;
  vector<double> *trackPt;
  vector<double> *trackP;
  vector<double> *trackGenPt;
  vector<double> *trackASmi;
  vector<double> *trackHarm2;
  vector<double> *trackCaloIso;
  vector<double> *trackMass;
  vector<double> *trackIsolation;
  vector<double> *trackGenE;
  vector<double> *trackGenEt;
  vector<double> *trackEndVertexRho ;
  vector<double> *trackChi2;
  vector<double> *trackNdof;
  vector<double> *trackHCALRp5Isolation;
  vector<double> *trackECALRp5Isolation;
  vector<double> *trackHCALRp4Isolation;
  vector<double> *trackECALRp4Isolation;
  vector<double> *trackHCALRp3Isolation;
  vector<double> *trackECALRp3Isolation;
  vector<int>    *trackNLostOuter;
  vector<int>    *trackNLostMiddle;
  vector<int>    *trackNLostInner;
  vector<int>    *trackNValid;
  vector<int>    *trackPdgId;
  double weight;
  double weight_xsec_lumi;
  double met;
  double leadingJetPt;

  vector<double> *trackDeDx1;
  vector<double> *trackDeDx2;
  vector<double> *trackDeDx3;
  vector<double> *trackDeDx4;
  vector<double> *trackDx1;
  vector<double> *trackDx2;
  vector<double> *trackDx3;
  vector<double> *trackDx4;

  vector<int>    *trackMeasSize;

  sample(){

    tree=0;
    file=0;
    histo=0;
    statistics=0;
    purity=0;

    trackEta        = 0;
    trackEta        = 0;
    trackPt         = 0;
    trackP          = 0;
    trackGenPt      = 0;
    trackASmi       = 0;
    trackHarm2      = 0;
    trackCaloIso    = 0;
    trackMass       = 0;
    trackIsolation  = 0;
    trackGenE       = 0;
    trackGenEt      = 0;
    trackEndVertexRho = 0;
    trackChi2 = 0;
    trackNdof = 0;
    trackHCALRp5Isolation = 0;
    trackECALRp5Isolation = 0;
    trackHCALRp4Isolation = 0;
    trackECALRp4Isolation = 0;
    trackHCALRp3Isolation = 0;
    trackECALRp3Isolation = 0;
    trackNLostOuter = 0;
    trackNLostMiddle = 0;
    trackNLostInner = 0;
    trackNValid     = 0;
    trackPdgId      = 0;
    trackDeDx1   = 0;
    trackDeDx2   = 0;
    trackDeDx3   = 0;
    trackDeDx4   = 0;
    trackDx1   = 0;
    trackDx2   = 0;
    trackDx3   = 0;
    trackDx4   = 0;
    trackMeasSize= 0;
  };

  void getTreeVariables(){
    tree->SetBranchAddress("trackEta",&trackEta);
    tree->SetBranchAddress("trackPt",&trackPt);
    tree->SetBranchAddress("trackP",&trackP);
    tree->SetBranchAddress("trackGenPt",&trackGenPt);
    tree->SetBranchAddress("trackDeDxASmi",&trackASmi);
    tree->SetBranchAddress("trackDeDxHarm2",&trackHarm2);
    tree->SetBranchAddress("trackCaloIsolation",&trackCaloIso);
    tree->SetBranchAddress("trackMass",&trackMass);
    tree->SetBranchAddress("trackIsolation",&trackIsolation);
    tree->SetBranchAddress("trackGenE",&trackGenE);
    tree->SetBranchAddress("trackGenEt",&trackGenEt);
    tree->SetBranchAddress("trackEndVertexRho",&trackEndVertexRho);
    tree->SetBranchAddress("trackChi2",&trackChi2);
    tree->SetBranchAddress("trackNdof",&trackNdof);
    tree->SetBranchAddress("trackNLostOuter",&trackNLostOuter);
    tree->SetBranchAddress("trackNLostInner",&trackNLostInner);
    tree->SetBranchAddress("trackNLostMiddle",&trackNLostMiddle);
    tree->SetBranchAddress("trackNValid",&trackNValid);
    tree->SetBranchAddress("trackHCALRp5Isolation",&trackHCALRp5Isolation);
    tree->SetBranchAddress("trackECALRp5Isolation",&trackECALRp5Isolation);
    tree->SetBranchAddress("trackHCALRp4Isolation",&trackHCALRp4Isolation);
    tree->SetBranchAddress("trackECALRp4Isolation",&trackECALRp4Isolation);
    tree->SetBranchAddress("trackHCALRp3Isolation",&trackHCALRp3Isolation);
    tree->SetBranchAddress("trackECALRp3Isolation",&trackECALRp3Isolation);
    tree->SetBranchAddress("trackPdgId",&trackPdgId);
    tree->SetBranchAddress("MET",&met);
    tree->SetBranchAddress("LeadingJetPt",&leadingJetPt);
    tree->SetBranchAddress("weight",&weight);
    tree->SetBranchAddress("weight_xsec_lumi",&weight_xsec_lumi);
    tree->SetBranchAddress("trackDeDx1",&trackDeDx1);
    tree->SetBranchAddress("trackDeDx2",&trackDeDx2);
    tree->SetBranchAddress("trackDeDx3",&trackDeDx3);
    tree->SetBranchAddress("trackDeDx4",&trackDeDx4);
    tree->SetBranchAddress("trackDx1",&trackDx1);
    tree->SetBranchAddress("trackDx2",&trackDx2);
    tree->SetBranchAddress("trackDx3",&trackDx3);
    tree->SetBranchAddress("trackDx4",&trackDx4);
    tree->SetBranchAddress("trackMeasSize",&trackMeasSize);
  };


  void Selection(bool doKinSelection=false, bool doTrkSelection=false, double ptCut=20, double ecaloCut=5){

    statistics = 0;
    purity=0;
    double auxWeight = 0;

    histo= new TH1D("count","count",1,0,1);
    histo->Sumw2();

    cout<<"N events = "<<tree->GetEntries()<<endl;
    
    for(int n=0; n<tree->GetEntries(); n++){

      tree->GetEntry(n);

      auxWeight = weight_xsec_lumi*weight;


      if(doKinSelection){
	if(met<0)                         continue;
	if(leadingJetPt<0)                continue;	
      }


      if(doTrkSelection){


	//if(trackEta->size()>1)   cout<<"trackEta->size() = "<<trackEta->size()<<endl;
	for(unsigned int i=0; i<trackEta->size(); i++){

	  if(abs(trackEta->at(i))>2.1)                                 continue;
	  if(abs(trackEta->at(i))>1.42 && abs(trackEta->at(i))<1.65 )  continue;
	
	  if(trackPt->at(i)<ptCut)                                     continue;
	  if(trackCaloIso->at(i)>ecaloCut)                             continue;
	
	  // ****************************************** Particle Id **********************************
	  purity+=auxWeight;
	  if(abs(trackPdgId->at(i))!=0)      continue; 
	  statistics +=auxWeight;
	  histo -> Fill(0.5,auxWeight);
	  break;
	  // ****************************************** Particle Id **********************************
	} 

      }
      else{
	//for(unsigned int i=0; i<trackEta->size(); i++){
	statistics +=auxWeight;
	histo -> Fill(0.5,auxWeight);
	//}
      }
      purity=statistics/purity;
    }
  };
};


int getSysUncertainty(double ptCut, double ecaloCut){


  // %%%%%%%%%%  Fake rate from Wjets MC  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Uncertainty estimation is done by comparing fake rate (=#fakes/#events) in wjets mc and z->ll mc
  sample wjetsKin;
  sample wjetsDT;

  wjetsKin.file = new TFile(fileSR + "/wjets.root","READ");
  //wjetsKin.file -> GetObject("chiTracksQCDsupression/Variables",wjetsKin.tree);
  wjetsKin.file -> GetObject("chiTrackstriggerRequirements/Variables",wjetsKin.tree);
  //wjetsKin.file -> GetObject("chiTracksnoSelection/Variables",wjetsKin.tree);
  wjetsKin.getTreeVariables();
  wjetsKin.file -> GetObject("chiTrackspreselectionNoQCDCuts/Variables",wjetsDT.tree);
  //wjetsKin.file -> GetObject("chiTrackspreselectionNoQCDCutsNoTrigger/Variables",wjetsDT.tree);
  wjetsDT.getTreeVariables();

  //wjetsKin.Selection(0,0);
  wjetsKin.histo= new TH1D("wjetsKin","wjetsKin",1,0,1);
  wjetsKin.histo->Sumw2();
  wjetsKin.tree -> Draw("0.5>>wjetsKin","weight_xsec_lumi*weight");
  wjetsKin.histo = (TH1D*) gPad->GetListOfPrimitives()->FindObject("wjetsKin");
  wjetsDT.Selection(0,1, ptCut, ecaloCut);

  
  cout<<"###########################################################################"<<endl;
  cout.precision(2);
  double intKinError = 0;
  double intKin      = wjetsKin.histo -> IntegralAndError(1,1,intKinError);
  double intDTError = 0;
  double intDT      = wjetsDT.histo -> IntegralAndError(1,1,intDTError);
  cout<<scientific<<"Number of events in kin. selection = "<<intKin<<" +/- "<<intKinError<<endl;
  cout<<            "wjets: Number of fakes             = "<<intDT<<" +/- "<<intDTError<<endl;
  if(intDT==0)       intDT = 1.15*14.52;
  double fakeRateWjets      = intDT/intKin; 
  double fakeRateWjetsError = fakeRateWjets * sqrt( pow(intKinError/intKin, 2)  +  pow(intDTError/intDT, 2) ); 
  cout<<"Fake rate from wjets MC            = "<<scientific<<fakeRateWjets<<" +/- "<<fakeRateWjetsError<<endl;
  cout<<"###########################################################################"<<endl;


  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //%%%%%%%%%%  Fake rate from Zmumu MC  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //
  sample dytomumuKin;
  sample dytomumuDT;

  dytomumuKin.file = new TFile(fileDYToLL + "/dytollAODSIM.root","READ");
  dytomumuKin.file -> GetObject("chiTracksnoSelectionTightMuons/Variables",dytomumuKin.tree);
  dytomumuKin.getTreeVariables();
  dytomumuKin.file -> GetObject("chiTrackspreselectionTightMuons/Variables",dytomumuDT.tree);
  dytomumuDT.getTreeVariables();

  //dytomumuKin.Selection(0, 0);
  dytomumuKin.histo= new TH1D("dytomumuKin","dytomumuKin",1,0,1);
  dytomumuKin.histo->Sumw2();
  dytomumuKin.tree -> Draw("0.5>>dytomumuKin","weight_xsec_lumi*weight");
  dytomumuKin.histo = (TH1D*) gPad->GetListOfPrimitives()->FindObject("dytomumuKin");
  dytomumuDT.Selection(0, 1, ptCut, ecaloCut);

  cout<<"###########################################################################"<<endl;
  double intKinErrorMuMu = 0;
  double intKinMuMu      = dytomumuKin.histo -> IntegralAndError(1,1,intKinErrorMuMu);
  double intDTErrorMuMu = 0;
  double intDTMuMu      = dytomumuDT.histo -> IntegralAndError(1,1,intDTErrorMuMu);
  cout<<scientific<<"Number of events in kin. selection = "<<intKinMuMu<<" +/- "<<intKinErrorMuMu<<endl;
  cout<<            "dytomumu: Number of fakes             = "<<intDTMuMu<<" +/- "<<intDTErrorMuMu<<endl;
  if(intDT==0)       intDT = 1.15*14.52;
  double fakeRateDytomumu      = intDTMuMu/intKinMuMu; 
  double fakeRateDytomumuError = intDTMuMu/intKinMuMu * sqrt( pow(intKinErrorMuMu/intKinMuMu, 2)  +  pow(intDTErrorMuMu/intDTMuMu, 2) ); 
  cout<<"Fake rate from dytomumu MC            = "<<scientific<<fakeRateDytomumu<<" +/- "<<fakeRateDytomumuError<<endl;
  cout<<"###########################################################################"<<endl;
  //%%%%%%%%%%  Fake rate from Zee MC   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // 
  sample dytoeeKin;
  sample dytoeeDT;

  dytoeeKin.file = new TFile(fileDYToLL + "/dytollAODSIM.root","READ");
  dytoeeKin.file -> GetObject("chiTracksnoSelectionTightElectrons/Variables",dytoeeKin.tree);
  dytoeeKin.getTreeVariables();
  dytoeeKin.file -> GetObject("chiTrackspreselectionTightElectrons/Variables",dytoeeDT.tree);
  dytoeeDT.getTreeVariables();

  //dytoeeKin.Selection();
  dytoeeKin.histo= new TH1D("dytoeeKin","dytoeeKin",1,0,1);
  dytoeeKin.histo->Sumw2();
  dytoeeKin.tree -> Draw("0.5>>dytoeeKin","weight_xsec_lumi*weight");
  dytoeeKin.histo = (TH1D*) gPad->GetListOfPrimitives()->FindObject("dytoeeKin");
  dytoeeDT.Selection(0, 1, ptCut, ecaloCut);

  cout<<"###########################################################################"<<endl;
  double intKinErrorEE = 0;
  double intKinEE      = dytoeeKin.histo -> IntegralAndError(1,1,intKinErrorEE);
  double intDTErrorEE  = 0;
  double intDTEE       = dytoeeDT.histo -> IntegralAndError(1,1,intDTErrorEE);
  cout<<scientific<<"Number of events in kin. selection = "<<intKinEE<<" +/- "<<intKinErrorEE<<endl;
  cout<<            "dytoee: Number of fakes            = "<<intDTEE<<" +/- "<<intDTErrorEE<<endl;
  if(intDT==0)       intDT = 1.15*14.52;
  double fakeRateDytoee      = intDTEE/intKinEE; 
  double fakeRateDytoeeError = intDTEE/intKinEE * sqrt( pow(intKinErrorEE/intKinEE, 2)  +  pow(intDTErrorEE/intDTEE, 2) ); 
  cout<<            "Fake rate from dytoee MC           = "<<scientific<<fakeRateDytoee<<" +/- "<<fakeRateDytoeeError<<endl;
  cout<<"###########################################################################"<<endl;

  //%%%%%%%%%%  Z->mumu  and Z->ee together  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  double dytollKin     = intKinMuMu + intKinEE;
  double dytollKinErr  = sqrt( pow( intKinErrorMuMu , 2)  +  pow( intKinErrorEE , 2) ) ;
  double dytollDT      = intDTMuMu + intDTEE;
  double dytollDTErr   = sqrt( pow( intDTErrorMuMu , 2)  +  pow( intDTErrorEE , 2) ) ;

  double fakeRateDytoll      = dytollDT/dytollKin;
  double fakeRateDytollError = dytollDT/dytollKin * sqrt( pow(dytollKinErr/dytollKin, 2)  +  pow(dytollDTErr/dytollDT, 2) ); 
  
  cout<<"###########################################################################"<<endl;
  cout<<scientific<<"Number of events in kin. selection = "<<dytollKin<<" +/- "<<dytollKinErr<<endl;
  cout<<            "dytoll: Number of fakes            = "<<dytollDT<< " +/-$ "<<dytollDTErr<<endl;
  cout<<            "Fake rate from dytoll MC           = "<<scientific<<fakeRateDytoll<<" +/- "<<fakeRateDytollError<<endl;
  cout<<"###########################################################################"<<endl;
  

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //%%%%%%%%%%  Rel Difference between fake rate of the two samples  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  cout<<"###########################################################################"<<endl;
  cout<<"Fake rate from wjets MC            = ("<<fixed<<fakeRateWjets*pow(10,6)<<" $\\pm$ "<<fakeRateWjetsError*pow(10,6)<<") $10^{-6}$"<<endl;
  cout<<"Fake rate from dytoll MC           = ("<<fixed<<fakeRateDytoll*pow(10,6)<<" $\\pm$ "<<fakeRateDytollError*pow(10,6)<<") $10^{-6}$"<<endl;
  double ratio = fakeRateWjets/fakeRateDytoll;
  double ratioError = ratio* sqrt(  pow( fakeRateWjetsError/fakeRateWjets ,2 )  +  pow( fakeRateDytollError/fakeRateDytoll ,2 ) );
  cout<<fixed<<"Ratio       = "<<ratio<<" +/- "<<ratioError<<" $\\rightarrow$ ";
  double uncertainty = (max(abs(ratio-ratioError-1),abs(ratio+ratioError-1)));
  cout<<fixed<<"Uncertainty = "<<uncertainty*100<<"\\%"<<endl;
  cout<<"###########################################################################"<<endl;
  cout.precision(5);
  cout<<"Final Uncertainty = "<<fixed<<uncertainty<<endl;
  
  return 0;
 
}

//################################################################################################################################
//################################################################################################################################
