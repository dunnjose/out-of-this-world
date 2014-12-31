//
//  OWDetailViewController.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/4/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWDetailViewController.h"

@interface OWDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *gravitationalForce;
@property (strong, nonatomic) IBOutlet UILabel *diameter;
@property (strong, nonatomic) IBOutlet UILabel *yearLength;
@property (strong, nonatomic) IBOutlet UILabel *dayLength;
@property (strong, nonatomic) IBOutlet UILabel *temperature;
@property (strong, nonatomic) IBOutlet UILabel *numberOfMoons;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UITextView *interestFact;

@end

@implementation OWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.spaceObject);
    
    self.name.text = [NSString stringWithFormat:@"Name: %@", self.spaceObject.name];
    self.gravitationalForce.text = [NSString stringWithFormat:@"Gravitational Force: %f", self.spaceObject.gravitationalForce];
    self.diameter.text = [NSString stringWithFormat:@"Diameter: %f", self.spaceObject.diameter];
    self.yearLength.text = [NSString stringWithFormat:@"Year Length: %f", self.spaceObject.yearLength];
    self.dayLength.text = [NSString stringWithFormat:@"Day Length: %f", self.spaceObject.dayLength];
    self.temperature.text = [NSString stringWithFormat:@"Temperature: %f", self.spaceObject.temperature];
    self.numberOfMoons.text = [NSString stringWithFormat:@"Moons: %i", self.spaceObject.numberOfMoons];
    self.nickname.text = [NSString stringWithFormat:@"Nickname: %@", self.spaceObject.nickname];
    self.interestFact.text = self.spaceObject.interestFact;
    
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

@end
