//
//  ZbarPlug.m
//  Phun
//
//  Created by Jeff Lee on 12/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ZbarPlug.h"

@implementation ZbarPlug

- (void)showZbar:(NSArray*)arguments withDict:(NSDictionary*)options
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
	
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology: ZBAR_I25
				   config: ZBAR_CFG_ENABLE
					   to: 0];
	
    // present and release the controller
    [[super appViewController] presentModalViewController:reader animated:YES];
    [reader release];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
	//UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
    ZBarSymbol *symbol = nil;

    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
	
	NSString* retStr = [ NSString stringWithFormat:@"window.plugins.ZbarPlug.data = \"%@\";", 
						symbol.data];
	[ webView stringByEvaluatingJavaScriptFromString:retStr ];	
	
        // if you need a javascript callback I would put it here (example)
        // the callback can use the barcode data that was stored in window.plugins.ZbarPlug.data
        // NSString* callbackStr = [ NSString stringWithFormat:@"window.plugins.ZbarPlug.finished_callback()"];

        // this will execute the your javascript callback
        //[ webView stringByEvaluatingJavaScriptFromString:callbackStr ];

	[info objectForKey: UIImagePickerControllerOriginalImage];
	
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [[super appViewController] dismissModalViewControllerAnimated:YES];
}

@end


