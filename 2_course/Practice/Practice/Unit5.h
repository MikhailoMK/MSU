//---------------------------------------------------------------------------

#ifndef Unit5H
#define Unit5H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.BaseImageCollection.hpp>
#include <Vcl.ImageCollection.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TSplashScreen : public TForm
{
__published:	// IDE-managed Components
	TVirtualImage *VirtualImage1;
	TVirtualImage *VirtualImage2;
	TLabel *Label1;
	TImageCollection *ImageCollection1;
private:	// User declarations
public:		// User declarations
	__fastcall TSplashScreen(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSplashScreen *SplashScreen;
//---------------------------------------------------------------------------
#endif
