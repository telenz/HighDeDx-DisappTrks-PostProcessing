#include "../poisson/getPoissonCL.h"
#include "TGraphAsymmErrors.h"

class sample{


public:

  TFile *file;
  TString filename;
  TTree *tree;

  TH1D* histo;

  int    statistics;
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
  vector<int>    *trackStatus;
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

  sample(TString _filename){

    filename = _filename;
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
    trackStatus     = 0;
    trackDeDx1   = 0;
    trackDeDx2   = 0;
    trackDeDx3   = 0;
    trackDeDx4   = 0;
    trackDx1   = 0;
    trackDx2   = 0;
    trackDx3   = 0;
    trackDx4   = 0;
    trackMeasSize= 0;

    //   Double_t xbinsECalo[3]  = {0,20,200};
    //Double_t xbinsASmi[3]   = {0,0.3,1};
    //Double_t xbinsNHits[4]  = {3,5,7,25};

    //histoECalo  = new TH1D("predASmi","predASmi",2,xbinsECalo);
    //histoASmi   = new TH1D("predASmi","predASmi",2,xbinsASmi);
    //histoNValid = new TH1D("predNValid","predNValid",3,xbinsNHits);
  };

  void getTree(TString idir){

    TFile *f1 = new TFile(idir + "/" + filename + ".root","READ");
    if(!f1){
      cout<<"File not available: "<<filename<<endl<<endl;
    }
    f1->GetObject("chiTrackspreselectionTrigger/Variables",tree);
  }
  
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
    tree->SetBranchAddress("trackStatus",&trackStatus);
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


  void Selection(bool doMatching, int pdgId, double metCut=0, double jetPtCut=0, double ptCut=35.,double iasCut=0.0, bool doEcaloCut=0, double ecaloCut=5., bool scaling=0, TString region="CR1"){

    
    histo->SetTitle("");

    statistics = 0;
    purity=0;

    //cout<<"doEcaloCut = "<<doEcaloCut<<endl;
    cout<<"Entries = "<<tree->GetEntries()<<endl;


    for(int n=0; n<tree->GetEntries(); n++){


      tree->GetEntry(n);

     
      if(met<metCut)                       continue;
      if(leadingJetPt<jetPtCut)            continue;

      for(unsigned int i=0; i<trackNLostOuter->size(); i++){

	//if(trackNLostOuter->at(i)<1)                                 continue; 
	if(abs(trackEta->at(i))>2.1)                                 continue;
	if(abs(trackEta->at(i))>1.42 && abs(trackEta->at(i))<1.65 )  continue;
	if(trackPt->at(i)<ptCut)                                     continue;
	//if(trackNValid->at(i)<5)         continue;
     
	// Select region of interest
	if(region=="CR1"){

	  if(trackCaloIso->at(i) < ecaloCut)   continue;
	  if(!scaling){
	    if(trackASmi->at(i)    < iasCut)     continue;
	  }

	}
	else if(region=="CR2"){

	  if(trackCaloIso->at(i) < ecaloCut)   continue;
	  if(!scaling){
	    if(trackASmi->at(i)    > iasCut)     continue;
	  }

	}
	else if(region=="CR3"){

	  if(doEcaloCut){
	    if(trackCaloIso->at(i) > ecaloCut)   continue;
	  }
	  if(!scaling){
	    if(trackASmi->at(i)  > iasCut)     continue;
	  }

	}
	else if(region=="SR"){

	  if(doEcaloCut){
	    if(trackCaloIso->at(i) > ecaloCut)   continue;
	  }
	  if(!scaling){
	    if(trackASmi->at(i)    < iasCut)     continue;
	  }

	}
	//if(trackNValid->at(i)<7) continue;

        // ****************************************** Particle Id **********************************
	purity+=1;
	if(doMatching){
	  if(abs(trackPdgId->at(i))!=pdgId)      continue; 
	}
	// ****************************************** Particle Id **********************************
	
	//histo         -> Fill(0.5);
	//histo         -> Fill(0.5,weight);
	histo         -> Fill(0.5,weight*weight_xsec_lumi);
	//if(weight>1) cout<<"weight = "<<weight*weight_xsec_lumi<<endl;
	//      cout<<"weight_xsec_lumi = "<<weight_xsec_lumi<<endl;

	statistics +=1;
	break;
      }
    
    }

    purity=statistics/purity;
  };

};


//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_19_testSignal/results/analyzer/ntuples/input_weighted/";
//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt20/results/analyzer/ntuples/input_weighted/";


TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_06_15_METGt0_JetPtGt70_trackPtGt20/results/analyzer/ntuples/input_weighted/";
//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt30/results/analyzer/ntuples/input_weighted/";
//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_06_08_newSignalSamples/results/analyzer/ntuples/input_weighted/";
//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_06_01_METGt0_JetPtGt0_newSignalSamples/results/analyzer/ntuples/input_weighted/";
//TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_08_METGt0_JetPtGt0/results/analyzer/ntuples/input_weighted/";
TString filePionCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_08_METGt0_JetPtGt0_TauCS/results/analyzer/ntuples/input_weighted/";
TString fileElectronCS  = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_08_METGt0_JetPtGt0_ElectronCS/results/analyzer/ntuples/input_weighted/";
TString fileMuonCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_08_METGt0_JetPtGt0_MuonCS/results/analyzer/ntuples/input_weighted/";

/*
TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt20/results/analyzer/ntuples/input_weighted/";
TString filePionCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt20_TauCS/results/analyzer/ntuples/input_weighted/";
TString fileElectronCS  = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt20_ElectronCS/results/analyzer/ntuples/input_weighted/";
TString fileMuonCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_22_METGt0_JetPtGt0_TauPtGt30_SubJetPtGt20_MuonCS/results/analyzer/ntuples/input_weighted/";
*/
/*
TString fileSR          = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_01_METGt0_JetPtGt70_withData_andSignal/results/analyzer/ntuples/input_weighted/";
TString filePionCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_01_METGt0_JetPtGt70_TauCS/results/analyzer/ntuples/input_weighted/";
TString fileElectronCS  = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_01_METGt0_JetPtGt70_ElectronCS/results/analyzer/ntuples/input_weighted/";
TString fileMuonCS      = "~/xxl-af-cms/ANALYSIS/workdir/analysis_2015_05_01_METGt0_JetPtGt70_MuonCS/results/analyzer/ntuples/input_weighted/";
*/

