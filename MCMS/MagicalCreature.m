//
//  MagicalCreature.m
//  MCMS
//
//  Created by Vala Kohnechi on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature


-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    self.name = name;
    self.detail = [NSString stringWithFormat:@"unknown"];
    NSString *currentImage = [NSString stringWithFormat:@"%@",self.detail];
    self.image = [UIImage imageNamed:currentImage];
    NSString *damage = [NSString stringWithFormat:@"%d",arc4random_uniform(10) + 1];
    NSString *health = [NSString stringWithFormat:@"%d",arc4random_uniform(151) + 50];
    self.accessories = [@[health, damage] mutableCopy];
    return self;
}
@end
