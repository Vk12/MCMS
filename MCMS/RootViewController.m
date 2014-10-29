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
@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *dragon = [[MagicalCreature alloc] initWithName:@"Alexstrausa"];
    dragon.image = [UIImage imageNamed:@"dragon"];
    dragon.detail = [NSString stringWithFormat:@"dragon"];
MagicalCreature *hobbit = [[MagicalCreature alloc]
                               initWithName:@"Frodo"];
    hobbit.image = [UIImage imageNamed:@"hobbit"];
    hobbit.detail = [NSString stringWithFormat:@"hobbit"];

    MagicalCreature *elf = [[MagicalCreature alloc] initWithName:@"Legolas"];
    elf.image = [UIImage imageNamed:@"elf"];
    elf.detail = [NSString stringWithFormat:@"elf"];

    
    self.creatures = [@[dragon,hobbit,elf] mutableCopy];
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
    return cell;
}

- (IBAction)addButton:(id)sender
{
    if (![self.textField.text isEqualToString:@""])
    {
        MagicalCreature *addCreature = [[MagicalCreature alloc]init];
        addCreature.name = self.textField.text;
        [self.creatures addObject:addCreature];
        [self.tableView reloadData];
        [self.textField resignFirstResponder];
        self.textField.text = @"";
    }
    
   
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self addButton:nil];
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    MagicalCreature *theCreature = [self.creatures objectAtIndex:rowNumber];
    vc.creature =theCreature;
    
    vc.navigationItem.title =[self.creatures[rowNumber] name];
//    vc.detailLabel.text = [self.creatures[rowNumber] detail];
}





@end
