//
//  OWSpaceImageViewController.h
//  Out of this World
//
//  Created by Dunn, Joseph on 11/4/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) OWSpaceObject *spaceObject;



@end
