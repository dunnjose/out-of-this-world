//
//  OWOuterSpaceTableViewController.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/1/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"
#import "OWSpaceImageViewController.h"
#import "OWSpaceDataViewController.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

#define ADDED_SPACE_OBJECT_KEY @"Added Space Object Array"

#pragma mark - Lazy Instantiation
-(NSMutableArray *)planets
{
    if(!_planets){
        _planets = [[NSMutableArray alloc]init];
        }
    return _planets;
}
-(NSMutableArray *)addedSpaceObjects
{
    if(!_addedSpaceObjects){
        _addedSpaceObjects = [[NSMutableArray alloc]init];
    }
    return _addedSpaceObjects;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//self.planets = [[NSMutableArray alloc]init];
    
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData addImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
    }
    
    NSArray *myPlanetAsPropertyLists = [[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECT_KEY];
    
    for (NSDictionary *dictionary in myPlanetAsPropertyLists) {
        OWSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
    }
    
//    NSString *plant1 = @"Mercury";
//     NSString *plant2 = @"Venus";
//     NSString *plant3 = @"Earth";
//     NSString *plant4 = @"Mars";
//     NSString *plant5 = @"Jupiter";
//     NSString *plant6 = @"Satun";
//    NSString *plant7 = @"Uranus";
//    NSString *plant8 = @"Neptune";
    
//    [self.planets addObject:plant1];
//    [self.planets addObject:plant2];
//    [self.planets addObject:plant3];
//    [self.planets addObject:plant4];
//    [self.planets addObject:plant5];
//    [self.planets addObject:plant6];
//    [self.planets addObject:plant7];
//    [self.planets addObject:plant8];
    
//    self.planets = [[NSMutableArray  alloc]initWithObjects:plant1, plant2, plant3, plant4,
//                    plant5, plant6, plant7, plant8, nil];
   
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc]init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"ocean color"];
//    [myDictionary setObject:@"yellow" forKey:@"star color"];
//    
//    NSLog(@"%@", myDictionary);
//    NSString *blueString = [myDictionary objectForKey:@"ocean color"];
//     NSLog(@"%@", blueString);
    
//    NSNumber *myNumber = [NSNumber numberWithInt:5];
//    NSLog(@"%@",myNumber);
    
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OWAddSpaceObjectViewController Delegate
-(void)didCancel{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addSpaceObject:(OWSpaceObject *)spaceObject {
    
    /* if (!self.addedSpaceObjects){
       self.addedSpaceObjects = [[NSMutableArray alloc]init];
        } */
    
    // now using getter method
    [self.addedSpaceObjects addObject:spaceObject];
    
    NSLog(@"addSpaceObject");
    // Will Save to NSUserDefaults
    NSMutableArray *spaceObjectAsPropertyLists = [[[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECT_KEY] mutableCopy];
    if (!spaceObjectAsPropertyLists) spaceObjectAsPropertyLists = [[NSMutableArray alloc]init];
    
    [spaceObjectAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    
    [[NSUserDefaults standardUserDefaults]setObject:spaceObjectAsPropertyLists forKey:ADDED_SPACE_OBJECT_KEY];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
    
}

#pragma mark - Helper Methods
-(NSDictionary *)spaceObjectAsAPropertyList:(OWSpaceObject *)spaceObject
{
    
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name,
                                 PLANET_GRAVITY : @(spaceObject.gravitationalForce),
                                 PLANET_DIAMETER : @(spaceObject.diameter),
                                 PLANET_YEAR_LENGTH : @(spaceObject.yearLength),
                                 PLANET_DAY_LENGTH : @(spaceObject.dayLength),
                                 PLANET_TEMPERATURE : @(spaceObject.temperature),
                                 PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons),
                                 PLANET_NICKNAME : spaceObject.nickname,
                                 PLANET_INTERESTING_FACT : spaceObject.interestFact,
                                 PLANET_IMAGE : imageData};
    return dictionary;
}

-(OWSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    
    OWSpaceObject *spaceObject = [[OWSpaceObject alloc]initWithData:dictionary addImage:spaceObjectImage];
    
    return spaceObject;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    if ([self.addedSpaceObjects count]) {
        return 2;
    } else {
    return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    if (section == 1) {
        return [self.addedSpaceObjects count];
        
    } else {
    return self.planets.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 1) {
        OWSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    } else {
        
   
        OWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
      if ( [segue.destinationViewController isKindOfClass:[OWSpaceImageViewController class]]) {
            OWSpaceImageViewController *nextViewController = segue.destinationViewController;
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            
          OWSpaceObject *selectObject;
          if (path.section == 0) {
              selectObject = self.planets[path.row];
          } else if (path.section ==1){
              selectObject = self.addedSpaceObjects[path.row];
          }
              
          //    = [self.planets objectAtIndex:path.row];
            
            // PUT LOGIC HERE FOR self.addedSpaceObjects
            //OWSpaceObject *selectObject = [self.addedSpaceObjects objectAtIndex:path.row];
            
            nextViewController.spaceObject  = selectObject;
          
      }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]]) {
            OWSpaceDataViewController *targetViewController = segue.destinationViewController;
            
            NSIndexPath *path = sender;
            OWSpaceObject *selectedObject;
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            } else if (path.section ==1){
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            // PUT LOGIC HERE FOR self.addedSpaceObjects
            //OWSpaceObject *selectedObject = [self.addedSpaceObjects objectAtIndex:path.row];
            
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
       if ([segue.destinationViewController isKindOfClass:[OWAddSpaceObjectViewController class]]) {
          OWAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
          addSpaceObjectVC.delegate = self;
          }
    }
    
   }

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) return YES;
    else return NO;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc]init];
        
        for (OWSpaceObject *spaceObject in self.addedSpaceObjects) {
            [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
            }
        [[NSUserDefaults standardUserDefaults]setObject:newSavedSpaceObjectData forKey:ADDED_SPACE_OBJECT_KEY];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // this will call prepareForSegue above after setting the Identifier. This Identifier has been setup in storyboard
    // from the entire viewController OWOuterSpaceTableViewController to the OWSpaceDataViewController
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
    
}


@end
