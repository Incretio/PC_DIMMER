// DMXDemo.h : Haupt-Header-Datei f�r die Anwendung DMXDEMO
//

#if !defined(AFX_DMXDEMO_H__01E3DE23_09E1_11D5_B6C5_0010A701C436__INCLUDED_)
#define AFX_DMXDEMO_H__01E3DE23_09E1_11D5_B6C5_0010A701C436__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// Hauptsymbole

/////////////////////////////////////////////////////////////////////////////
// CDMXDemoApp:
// Siehe DMXDemo.cpp f�r die Implementierung dieser Klasse
//

class CDMXDemoApp : public CWinApp
{
public:
	CDMXDemoApp();

// �berladungen
	// Vom Klassenassistenten generierte �berladungen virtueller Funktionen
	//{{AFX_VIRTUAL(CDMXDemoApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementierung

	//{{AFX_MSG(CDMXDemoApp)
		// HINWEIS - An dieser Stelle werden Member-Funktionen vom Klassen-Assistenten eingef�gt und entfernt.
		//    Innerhalb dieser generierten Quelltextabschnitte NICHTS VER�NDERN!
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ f�gt unmittelbar vor der vorhergehenden Zeile zus�tzliche Deklarationen ein.

#endif // !defined(AFX_DMXDEMO_H__01E3DE23_09E1_11D5_B6C5_0010A701C436__INCLUDED_)
