//
//  OWAddSpaceObjectViewController.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/16/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWAddSpaceObjectViewController.h"

@interface OWAddSpaceObjectViewController ()

@end

@implementation OWAddSpaceObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender

{
    OWSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    
    [self.delegate addSpaceObject:newSpaceObject];
}

-(OWSpaceObject *)returnNewSpaceObject {
    OWSpaceObject *addSpaceObject = [[OWSpaceObject alloc]init];
    addSpaceObject.name = self.nameTextField.text;
    addSpaceObject.nickname = self.nicknameTextField.text;
    addSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addSpaceObject.temperature = [self.tempertureTextField.text floatValue];
    addSpaceObject.numberOfMoons = [self.numberofmoonsTextField.text intValue];
    addSpaceObject.interestFact = self.intrestingfactsTextField.text;
    return addSpaceObject;
    
}
@end
