//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit5.h"

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSplashScreen *SplashScreen;
//---------------------------------------------------------------------------
__fastcall TSplashScreen::TSplashScreen(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
