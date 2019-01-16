TBrowser *browser;

void tbrowser_quick_close(TObject *c) {
  TFile *file = (TFile*)c;
  file->Close();
}

void tbrowser_draw_same(TObject *c) {
  TBrowser *browser = (TBrowser*)gROOT->GetListOfBrowsers()->Last();
  TString draw_option(browser->GetDrawOption());
  if (draw_option != "") {
    draw_option = "same," + draw_option;
  } else {
    draw_option = "same";
  }
  c->Draw(draw_option);
  for (auto canvas : *gROOT->GetListOfCanvases()) {
    ((TCanvas*)canvas)->Update();
  }
}

void tbrowser_set_red(TObject *c) {
  TH1 *hist = (TH1*)c;
  hist->SetLineColor(kRed);
  for (auto canvas : *gROOT->GetListOfCanvases()) {
    ((TCanvas*)canvas)->Update();
  }
}

void tbrowser_print_address(TObject *c) {
  std::cout << c << std::endl;
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

void TBrowserOpen() {
  TClass *cl;
  cl = gROOT->GetClass("TFile");
  TList *tfile_menu_list = cl->GetMenuList();
  TClassMenuItem *quick_close_item = new TClassMenuItem(TClassMenuItem::kPopupUserFunction, cl, "Quick Close", "tbrowser_quick_close", 0, "TObject*", 2);
  tfile_menu_list->AddFirst(quick_close_item);

  for (auto class_suffix : {"TH1C", "TH1S", "TH1I", "TH1F", "TH1D", "TH2C", "TH2S", "TH2I", "TH2F", "TH2D"}) {
    cl = gROOT->GetClass(class_suffix);
    TList *th1_menu_list = cl->GetMenuList();
    TClassMenuItem *draw_same_item = new TClassMenuItem(TClassMenuItem::kPopupUserFunction, cl, "Draw same", "tbrowser_draw_same", 0, "TObject*", 2);
    th1_menu_list->AddFirst(draw_same_item);
    TClassMenuItem *set_red_item = new TClassMenuItem(TClassMenuItem::kPopupUserFunction, cl, "Set red", "tbrowser_set_red", 0, "TObject*", 2);
    th1_menu_list->AddFirst(set_red_item);
    TClassMenuItem *print_address_item = new TClassMenuItem(TClassMenuItem::kPopupUserFunction, cl, "Print address to console", "tbrowser_print_address", 0, "TObject*", 2);
    th1_menu_list->AddFirst(print_address_item);
  }

  browser = new TBrowser();

  // Add tab
  // add_tab(browser);
}
