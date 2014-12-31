//
//  OWSpaceImageViewController.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/4/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWSpaceImageViewController.h"
#import "OWDetailViewController.h"
#import "OWSpaceDataViewController.h"

@interface OWSpaceImageViewController ()
@property (strong, nonatomic) IBOutlet UIButton *detailsButton;

@end

@implementation OWSpaceImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
//    self.scrollView.bounds = self.view.bounds;
    
    self.detailsButton.hidden = YES;

    
//    NSLog(@"Scroll View %f, %f", self.scrollView.frame.size.height, self.scrollView.frame.size.width);
//    NSLog(@"Scroll View %f, %f", self.scrollView.frame.origin.x, self.scrollView.frame.origin.y);
//     NSLog(@"Scroll View %f, %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
//    NSLog(@"View View %f, %f", self.view.frame.size.height, self.view.frame.size.width);
//    NSLog(@"Image View  %f, %f", self.imageView.frame.size.height, self.imageView.frame.size.width);
//    NSLog(@"bounds View  %f, %f", self.scrollView.bounds.origin.x,self.scrollView.bounds.origin.y);
//    NSLog(@"---------");
  
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
//    self.scrollView.bounds = CGRectMake(0, 0, 320, 568);
    self.view.bounds = CGRectMake(0, 64, 320, 568);
//    self.imageView.bounds = CGRectMake(0, 0, self.spaceObject.spaceImage.size.width, self.spaceObject.spaceImage.size.height);
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.50;
  
//    NSLog(@"Scroll View %f, %f", self.scrollView.frame.size.height, self.scrollView.frame.size.width);
//    NSLog(@"Scroll View %f, %f", self.scrollView.frame.origin.x, self.scrollView.frame.origin.y);
//    NSLog(@"Scroll View %f, %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
//    NSLog(@"View View %f, %f", self.view.frame.size.height, self.view.frame.size.width);
//    NSLog(@"Image View  %f, %f", self.imageView.frame.size.height, self.imageView.frame.size.width);
//    NSLog(@"bounds View  %f, %f", self.scrollView.bounds.origin.x,self.scrollView.bounds.origin.y);
//

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    
    return self.imageView;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[UIButton class]]) {
        
        if ( [segue.destinationViewController isKindOfClass:[OWDetailViewController class]]) {
            OWDetailViewController *nextViewController = segue.destinationViewController;
           nextViewController.spaceObject  = self.spaceObject;
        }
    }
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ( [segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]]) {
            OWSpaceDataViewController *nextViewController = segue.destinationViewController;
            nextViewController.spaceObject  = self.spaceObject;
        }
        
    }
    
}


@end
