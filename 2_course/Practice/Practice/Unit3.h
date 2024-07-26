//---------------------------------------------------------------------------

#ifndef Unit3H
#define Unit3H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.BaseImageCollection.hpp>
#include <Vcl.ImageCollection.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Themes.hpp>
#include <Vcl.Styles.hpp>
//---------------------------------------------------------------------------
class TStudentRegistration : public TForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TVirtualImage *VirtualImage1;
	TEdit *Edit2;
	TEdit *Edit3;
	TLabel *Label1;
	TEdit *Edit4;
	TEdit *Edit5;
	TVirtualImage *VirtualImage3;
	TVirtualImage *VirtualImage4;
	TEdit *Edit6;
	TButton *Button1;
	TADOQuery *ADOQuery1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	void __fastcall VirtualImage3Click(TObject *Sender);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TStudentRegistration(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStudentRegistration *StudentRegistration;
//---------------------------------------------------------------------------
#endif
