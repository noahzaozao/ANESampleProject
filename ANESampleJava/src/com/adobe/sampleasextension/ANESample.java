package com.adobe.sampleasextension;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

/*
 * Initialization and finalization class of native extension.
 */
public class ANESample implements FREExtension
{
	/*
	 * Creates a new instance of ANESampleContext when the context is created 
	 * from the actionscript code.
	 */

	public static ANESampleContext context;
	
	public FREContext createContext(String extId) {	
		log("CONSTRUCTOR");
		return context = new ANESampleContext();
	}
	
	/*
	 * Called if the extension is unloaded from the process. Extensions
	 * are not guaranteed to be unloaded; the runtime process may exit without
	 * doing so.
	 */
	@Override
	public void dispose() {
	}

	/*
 	 * Extension initialization.
 	 */  
	public void initialize( ) {
	}
	
	public void log(String msg){
		System.out.println("[ ANESample.java ] "+msg);
	}
}
