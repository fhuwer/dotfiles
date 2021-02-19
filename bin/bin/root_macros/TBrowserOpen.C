#include "AtlasStyle.C"
#include "AtlasLabels.C"
#include "AtlasUtils.C"

TBrowser *browser;

TString get_tbrowser_draw_option(std::string additional_option = "") {
  TBrowser *browser = (TBrowser*)gROOT->GetListOfBrowsers()->Last();
  TString options(browser->GetDrawOption());
  if (additional_option == "") {
    return options;
  }

  if (options != "") {
    options = additional_option + "," + (std::string)options;
  } else {
    options = additional_option;
  }
  return options;
}

void update_canvases() {
  for (auto canvas : *gROOT->GetListOfCanvases()) {
    ((TCanvas*)canvas)->Modified();
    ((TCanvas*)canvas)->Update();
  }
}

void tbrowser_quick_close(TObject *c) {
  TFile *file = (TFile*)c;
  file->Close();
}

void tbrowser_draw_same(TObject *c) {
  c->Draw(get_tbrowser_draw_option("same"));
  update_canvases();
}

void tbrowser_draw_normed(TObject *c) {
  TH1F *h1 = (TH1F*)c;
  TH1F *h2 = (TH1F*)h1->Clone();
  h2->Scale(1 / h2->Integral());
  h2->Draw(get_tbrowser_draw_option());
  update_canvases();
}

void tbrowser_draw_tree_normed(TObject *c) {
  TBranch *b = (TBranch*)c;
  std::stringstream ss;
  ss << b->GetName() << ">>htx";
  b->GetTree()->Draw(ss.str().c_str(), "", get_tbrowser_draw_option("goff"));
  TH1F *hist = (TH1F*)gDirectory->Get("htx")->Clone("htx_c");
  hist->Scale(1. / hist->Integral());
  hist->Draw(get_tbrowser_draw_option());
  gDirectory->Delete("htx");
  update_canvases();
}

void tbrowser_draw_tree_normed_same_red(TObject *c) {
  TBranch *b = (TBranch*)c;
  std::stringstream ss;
  ss << b->GetName() << ">>htx";
  b->GetTree()->Draw(ss.str().c_str(), "", get_tbrowser_draw_option("same,goff"));
  TH1F *hist = (TH1F*)gDirectory->Get("htx")->Clone("htx_c");
  hist->Scale(1. / hist->Integral());
  hist->Draw(get_tbrowser_draw_option("same"));
  hist->SetLineColor(kRed);
  gDirectory->Delete("htx");
  update_canvases();
}

void tbrowser_draw_normed_same(TObject *c) {
  TH1F *h1 = (TH1F*)c;
  TH1F *h2 = (TH1F*)h1->Clone();
  h2->Scale(1 / h2->Integral());
  h2->Draw(get_tbrowser_draw_option("same"));
  update_canvases();
}

void tbrowser_draw_row_normed(TObject *c) {
  TH2F *h = (TH2F*)c;
  for (int i = 1; i <= h->GetNbinsY(); i++) {
    double sum = 0;
    for (int j = 1; j <= h->GetNbinsX(); j++) {
      sum += h->GetBinContent(j, i);
    }
    if (sum != 0) {
      for (int j = 1; j <= h->GetNbinsX(); j++) {
        h->SetBinContent(j, i, h->GetBinContent(j, i) / sum);
      }
    }
  }
  h->Draw(get_tbrowser_draw_option("colz"));
  update_canvases();
}

void tbrowser_draw_atlas(TObject *c, double x, double y, char *label) {
  SetAtlasStyle();
  c->Draw();
  ATLASLabel(x, y, label);
  update_canvases();
}

void tbrowser_draw_atlas_upper_right(TObject *c, char *label) {
  tbrowser_draw_atlas(c, 0.8, 0.8, label);
}

void tbrowser_set_red(TObject *c) {
  TH1 *hist = (TH1*)c;
  hist->SetLineColor(kRed);
  update_canvases();
}

void tbrowser_create_hist(TObject *c) {
  int i = 1;
  for (i = 1; i < 100; i++) {
    std::stringstream ss;
    ss << "h" << i;
    if (gROOT->GetListOfGlobals()->FindObject(ss.str().c_str()) == nullptr) {
      break;
    }
  }
  std::stringstream ss_command;
  ss_command << "TH1F *h" << i << " = (TH1F*)" << c << ";";
  gInterpreter->ProcessLine(ss_command.str().c_str());
  std::cout << "h" << i << std::endl;
}

void tbrowser_draw_range(TObject *c, int nbins, double xlow, double xup) {
  TBranch *branch = (TBranch*)c;
  branch->GetTree()->Draw(TString::Format("%s>>(%i,%f,%f)", branch->GetName(), nbins, xlow, xup),
      "", get_tbrowser_draw_option());
  update_canvases();
}

void tbrowser_draw_xup(TObject *c, double xup) {
  TBranch *branch = (TBranch*)c;
  branch->GetTree()->Draw(TString::Format("%s>>(%i,%f,%f)", branch->GetName(), 100, 0., xup), "",
      get_tbrowser_draw_option());
  update_canvases();
}

void tbrowser_draw_expr(TObject *c, char *expr) {
  TBranch *branch = (TBranch*)c;
  branch->GetTree()->Draw(branch->GetName(), expr, get_tbrowser_draw_option());
  update_canvases();
}

void tbrowser_branch_draw_same(TObject *c) {
  TBranch *branch = (TBranch*)c;
  branch->GetTree()->Draw(branch->GetName(), "", get_tbrowser_draw_option("same"));
  update_canvases();
}

void add_tab(TBrowser *browser) {
  TRootBrowser *browser_imp = (TRootBrowser*)browser->GetBrowserImp();
  TGMainFrame *main_frame = new TGMainFrame(browser_imp->GetTabBottom(), 300, 150);
  TGCompositeFrame *frame = new TGCompositeFrame(main_frame);
  TGVerticalFrame *btn_frame = new TGVerticalFrame(main_frame, 136, 152, kVerticalFrame);
  btn_frame->SetName("btn_frame");
  TGTextButton *btn_draw_red = new TGTextButton(btn_frame, "Draw Red", -1, TGTextButton::GetDefaultGC()(), TGTextButton::GetDefaultFontStruct());
  btn_frame->AddFrame(btn_draw_red, new TGLayoutHints(kLHintsLeft | kLHintsTop | kLHintsExpandX,2,2,2,2));

  frame->AddFrame(btn_frame, new TGLayoutHints(kLHintsExpandX | kLHintsExpandY,1,1,1,1));
  btn_frame->MoveResize(40,104,136,152);
  main_frame->AddFrame(frame);
  main_frame->MapSubwindows();
  main_frame->Resize(main_frame->GetDefaultSize());
  main_frame->MapWindow();
  main_frame->Resize(490,372);

  browser_imp->GetTabBottom()->AddTab("Plot Helper", main_frame);
}

void add_item(std::string class_name, std::string title, std::string func, std::string params,
    int object_pos) {
  TClass *cl = gROOT->GetClass(class_name.c_str());
  TList *menu_list = cl->GetMenuList();
  TClassMenuItem *item = new TClassMenuItem(TClassMenuItem::kPopupUserFunction, cl, title.c_str(),
      func.c_str(), 0, params.c_str(), object_pos);
  menu_list->AddFirst(item);
}

void TBrowserOpen() {
  add_item("TFile", "Quick Close", "tbrowser_quick_close", "TObject*", 2);
  for (auto class_name : {"TBranch", "TBranchElement"}) {
    add_item(class_name, "Draw normed", "tbrowser_draw_tree_normed", "TObject*", 0);
    add_item(class_name, "Draw normed same red", "tbrowser_draw_tree_normed_same_red", "TObject*", 0);
    add_item(class_name, "Draw branch range", "tbrowser_draw_range", "TObject*,int,double,double", 0);
    add_item(class_name, "Draw branch with expr", "tbrowser_draw_expr", "TObject*,char*", 0);
    add_item(class_name, "Draw branch with xup", "tbrowser_draw_xup", "TObject*,double", 0);
    add_item(class_name, "Draw same", "tbrowser_branch_draw_same", "TObject*", 0);
  }
  for (auto class_name : {"TH1C", "TH1S", "TH1I", "TH1F", "TH1D", "TH2C", "TH2S", "TH2I", "TH2F", "TH2D"}) {
    add_item(class_name, "Draw same", "tbrowser_draw_same", "TObject*", 2);
    add_item(class_name, "Set red", "tbrowser_set_red", "TObject*", 2);
    add_item(class_name, "Create hist in console", "tbrowser_create_hist", "TObject*", 2);
    add_item(class_name, "Draw ATLAS Style", "tbrowser_draw_atlas", "TObject*,double,double,char*", 0);
    add_item(class_name, "Draw ATLAS Style (ur)", "tbrowser_draw_atlas_upper_right", "TObject*,char*", 0);
  }
  for (auto class_name : {"TH1C", "TH1S", "TH1I", "TH1F", "TH1D"}) {
    add_item(class_name, "Draw normed", "tbrowser_draw_normed", "TObject*", 2);
    add_item(class_name, "Draw normed same", "tbrowser_draw_normed_same", "TObject*", 2);
  }
  for (auto class_name : {"TH2C", "TH2S", "TH2I", "TH2F", "TH2D"}) {
    add_item(class_name, "Draw row normed", "tbrowser_draw_row_normed", "TObject*", 2);
  }

  browser = new TBrowser();

  // Add tab
  // add_tab(browser);
}
