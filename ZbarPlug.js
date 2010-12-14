// Copy this file to PhoneGap's /www/ folder (created by the PhoneGapLib.xcodeproj
function ZbarPlug() {
	this.data = null;
}

ZbarPlug.prototype.action = function () {
	alert('data ' + this.data);
};

ZbarPlug.prototype.getQrCode = function () {
	PhoneGap.exec("ZbarPlug.showZbar");
};

PhoneGap.addConstructor( 
						function () {
						if (typeof window.plugins == 'undefined')
						window.plugins = {};
						if( typeof window.plugins.ZbarPlug == 'undefined' )
						window.plugins.ZbarPlug = new ZbarPlug();
						} );
