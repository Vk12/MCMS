//
//  BattleViewController.m
//  MCMS
//
//  Created by Alex on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import "BattleViewController.h"
#import "RootViewController.h"
#import "MagicalCreature.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *whoWonLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//   self.whoWonLabel.text =
    MagicalCreature *fighter1 = self.fightArray[0];
    NSString *name1 = [self.fightArray[0] name];
    int health1 = [fighter1.accessories[0] intValue];
    int damage1 = [fighter1.accessories[1] intValue];

    MagicalCreature *fighter2 = self.fightArray[1];
    NSString *name2 = [self.fightArray[1] name];
    int health2 = [fighter2.accessories[0] intValue];
    int damage2 = [fighter2.accessories[1] intValue];

    if (health1/damage2 > health2/damage1)
    {
        self.whoWonLabel.text = [NSString stringWithFormat:@"%@ is a winner!", name1];
    }
    else {self.whoWonLabel.text = [NSString stringWithFormat:@"%@ is a winner!", name2];}


}

- (void) viewWillDisappear:(BOOL)animated
{
    self.fightArray = [@[] mutableCopy];
}

@end
