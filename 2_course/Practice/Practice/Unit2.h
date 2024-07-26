//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Vcl.BaseImageCollection.hpp>
#include <Vcl.ImageCollection.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <System.Hash.hpp>
#include <System.NetEncoding.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.Themes.hpp>
#include <Vcl.Styles.hpp>
//---------------------------------------------------------------------------
class TPasswordWindow : public TForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TVirtualImage *VirtualImage1;
	TButton *Button1;
	TLabel *Label2;
	TVirtualImage *VirtualImage2;
	TCheckBox *CheckBox1;
	TLabel *Label3;
	TVirtualImage *VirtualImage3;
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall VirtualImage3Click(TObject *Sender);
	void __fastcall Label3Click(TObject *Sender);
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
private:	// User declarations
public:		// User declarations
	__fastcall TPasswordWindow(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPasswordWindow *PasswordWindow;
//---------------------------------------------------------------------------
#endif
