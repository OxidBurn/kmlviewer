//
//  MainViewModel.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Classes
#import "MainViewModel.h"
#import "MainModel.h"

static NSString* cellID = @"ItemsCellID";

@interface MainViewModel()

// properties

@property (strong, nonatomic) MainModel* model;

// methods

@end

@implementation MainViewModel

#pragma mark - Properties -

- (MainModel*) model
{
    if ( _model == nil )
    {
        _model = [[MainModel alloc] init];
    }
    
    return _model;
}

#pragma mark - Table view data source -

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView
{
    return 1;
}

- (NSInteger) tableView: (UITableView*) tableView
  numberOfRowsInSection: (NSInteger)    section
{
    return self.model.arrayOfFiles.count;
}

- (UITableViewCell*) tableView: (UITableView*) tableView
         cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    
    cell.textLabel.text = self.model.arrayOfFiles[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate methods -

- (void)       tableView: (UITableView*) tableView
 didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
    [tableView deselectRowAtIndexPath: indexPath
                             animated: YES];
    
    NSString* selectedFilePath = [self.model getPathOfFileWithIndex: indexPath.row];
    
    NSLog(@"File path: %@", selectedFilePath);
}

@end
