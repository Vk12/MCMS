//
//  ViewController.m
//  MCMS
//
//  Created by Vala Kohnechi on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *fightGroupArray;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *dragon = [[MagicalCreature alloc] initWithName:@"Alexstrausa"];
    dragon.image = [UIImage imageNamed:@"dragon"];
    dragon.detail = [NSString stringWithFormat:@"dragon"];
    dragon.accessories = [@[@"200", @"3"] mutableCopy];

    MagicalCreature *hobbit = [[MagicalCreature alloc] initWithName:@"Frodo"];
    hobbit.image = [UIImage imageNamed:@"hobbit"];
    hobbit.detail = [NSString stringWithFormat:@"hobbit"];
    hobbit.accessories = [@[@"80", @"6"] mutableCopy];

    MagicalCreature *elf = [[MagicalCreature alloc] initWithName:@"Nicolas"];
    elf.image = [UIImage imageNamed:@"elf"];
    elf.detail = [NSString stringWithFormat:@"elf"];
    elf.accessories = [@[@"60", @"10"] mutableCopy];

    
    self.creatures = [@[dragon,hobbit,elf] mutableCopy];
    self.fightGroupArray = [NSMutableArray array];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.creatures[indexPath.row] name];
    cell.detailTextLabel.text = [self.creatures[indexPath.row] detail];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (IBAction)addButton:(id)sender
{
    if (![self.textField.text isEqualToString:@""])
    {
        MagicalCreature *addCreature = [[MagicalCreature alloc] initWithName:self.textField.text];
        addCreature.name = self.textField.text;
        [self.creatures addObject:addCreature];
        [self.tableView reloadData];
        [self.textField resignFirstResponder];
        self.textField.text = @"";
    }
    
   
}
- (IBAction)onButtonPressedFight:(UIButton *)sender
{

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self addButton:nil];
    return YES;
}
- (IBAction)onRightSwipeSelect:(UISwipeGestureRecognizer *)swipe
{
    CGPoint point = [swipe locationInView:self.tableView];
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:point];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
         MagicalCreature *fighter = [self.creatures objectAtIndex:index.row];
if (cell.backgroundColor == [UIColor clearColor])
{
    cell.backgroundColor = [UIColor redColor];

    [self.fightGroupArray addObject:fighter];

}else
{
    cell.backgroundColor = [UIColor clearColor];
    [self.fightGroupArray removeObject:fighter];
}

}

     }
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"])
    {
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    MagicalCreature *theCreature = [self.creatures objectAtIndex:rowNumber];
    vc.creature =theCreature;
    
    vc.navigationItem.title =[self.creatures[rowNumber] name];
    } else
    {


BattleViewController *vc2 =segue.destinationViewController;
        vc2.fightArray = self.fightGroupArray;
    }
    
//    vc.detailLabel.text = [self.creatures[rowNumber] detail];
}







@end
