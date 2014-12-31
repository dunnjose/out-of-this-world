//
//  OWSpaceDataViewController.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/5/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWSpaceDataViewController.h"

@interface OWSpaceDataViewController ()

@end

@implementation OWSpaceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (self.spaceObject.interestFact) {
        
   
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:self.spaceObject.interestFact];
    NSInteger _stringLength=[self.spaceObject.interestFact length];
    
    UIColor *color=[UIColor colorWithRed:0.24 green:0.52 blue:0.78 alpha:1.0];
    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
    [attString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, _stringLength)];
      
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname:";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.diameter];
            break;
        case 2:
            cell.textLabel.text = @"Gravitional Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Year Length:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Day Length:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature(celsius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",self.spaceObject.numberOfMoons];
            break;
        case 7:
           // cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
            
            cell.textLabel.attributedText  = attString;
           // cell.textLabel.text = self.spaceObject.interestFact;
            cell.detailTextLabel.text = @"";
            break;
        default:
            break;
    }
    }
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
