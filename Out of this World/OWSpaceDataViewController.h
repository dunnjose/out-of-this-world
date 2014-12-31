//
//  OWSpaceDataViewController.h
//  Out of this World
//
//  Created by Dunn, Joseph on 11/5/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OWSpaceObject *spaceObject;

@end
