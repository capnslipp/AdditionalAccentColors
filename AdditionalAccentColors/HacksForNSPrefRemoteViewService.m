//
//  HacksForNSPrefRemoteViewService.m
//  AdditionalAccentColors
//
//  Created by Cap'n Slipp on 12/22/22.
//

#import "HacksForNSPrefRemoteViewService.h"



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types" // warning: incompatible pointer types returning 'PrefPane *' from a function with result type 'ColoredRadioButton *'
#pragma clang diagnostic ignored "-Wobjc-designated-initializers" // warning: convenience initializer missing a 'self' call to another initializer



@implementation ColoredRadioButton (HacksForNSPrefRemoteViewService)
- (id)initWithBundle:(nonnull NSBundle *)bundle {
	return [[PrefPane alloc] initWithBundle:bundle];
}
@end



#pragma clang diagnostic pop
