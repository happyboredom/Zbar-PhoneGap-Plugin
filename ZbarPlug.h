//
//  ZbarPlug.h
//  Phun
//
//  Created by Jeff Lee on 12/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhoneGapCommand.h"
#import "ZBarSDK.h"

@interface ZbarPlug : PhoneGapCommand <ZBarReaderViewDelegate>
{
}
- (void)showZbar:(NSArray*)arguments withDict:(NSDictionary*)options;

@end

