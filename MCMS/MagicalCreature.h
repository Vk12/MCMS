//
//  MagicalCreature.h
//  MCMS
//
//  Created by Vala Kohnechi on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *detail;
@property UIImage *image;
@property NSMutableArray *accessories;

-(instancetype)initWithName:(NSString *)name;
@end
