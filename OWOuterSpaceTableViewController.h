//
//  OWOuterSpaceTableViewController.h
//  Out of this World
//
//  Created by Dunn, Joseph on 11/1/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWAddSpaceObjectViewController.h"

@interface OWOuterSpaceTableViewController : UITableViewController <OWAddSpaceObjectViewControllerDelegate>

@property  (strong, nonatomic) NSMutableArray *planets;
@property  (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
