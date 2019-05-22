//
//  ViewController.m
//  MacApp
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 lwb. All rights reserved.
//

#import "ViewController.h"
#import "ScrayBugsDoc.h"
#import "ScrayBugData.h"
#import "EDStarRating.h"

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *bugTableView;



@property (nonatomic, strong)NSMutableArray *bugs;
@property (weak) IBOutlet NSTextField *bugTextField;
@property (weak) IBOutlet EDStarRating *bugRating;
@property (weak) IBOutlet NSImageView *bugImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScrayBugsDoc *bug1 = [[ScrayBugsDoc alloc] initWithTitle:@"PhotoBug" rating:4 thumbImage:[NSImage imageNamed:@"bug1"] fullImage:[NSImage imageNamed:@"bug1"]];
    ScrayBugsDoc *bug2 = [[ScrayBugsDoc alloc] initWithTitle:@"HouseBug" rating:5 thumbImage:[NSImage imageNamed:@"bug2"] fullImage:[NSImage imageNamed:@"bug2"]];
      ScrayBugsDoc *bug3 = [[ScrayBugsDoc alloc] initWithTitle:@"CarBug" rating:5 thumbImage:[NSImage imageNamed:@"bug3"] fullImage:[NSImage imageNamed:@"bug3"]];
    self.bugs = [NSMutableArray arrayWithObjects:bug1,bug2,bug3,nil];
    // Do any additional setup after loading the view.
}

- (IBAction)addBug:(NSButton *)sender {
     ScrayBugsDoc *addBugDoc = [[ScrayBugsDoc alloc] initWithTitle:@"PhotoBug" rating:4 thumbImage:[NSImage imageNamed:@"bug1"] fullImage:[NSImage imageNamed:@"bug1"]];
    [self.bugs addObject:addBugDoc];
    NSInteger newRowIndex = self.bugs.count-1;
    [self.bugTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:(NSTableViewAnimationEffectGap)];
    [self.bugTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [self.bugTableView scrollRowToVisible:newRowIndex];
    [self.bugTableView reloadData];
    
    
}

//获取选中的数据模型
- (ScrayBugsDoc *)selectedBugDoc {
    NSInteger selectedRow = [self.bugTableView selectedRow];
    if (selectedRow >= 0 && selectedRow < self.bugs.count) {
        ScrayBugsDoc *selectDoc = [self.bugs objectAtIndex:selectedRow];
        return selectDoc;
    }
    return nil;
}


//设置详情
- (void)setDetailInfo:(ScrayBugsDoc *)doc {
    NSString *title = @"";
    NSImage *image = nil;
    float rating = 0.0f;
    if (doc != nil) {
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    [self.bugTextField setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRating setRating:rating];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    ScrayBugsDoc *selectDoc = [self selectedBugDoc];
    [self setDetailInfo:selectDoc];
}


- (IBAction)deleteBug:(id)sender {
    ScrayBugsDoc *selectDoc = [self selectedBugDoc];
    if (selectDoc) {
        [self.bugs removeObject:selectDoc];
        [self.bugTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.bugTableView.selectedRow] withAnimation:(NSTableViewAnimationSlideRight)];
        
    }
    
    
}


- (IBAction)ButtonAction:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowsMultipleSelection:NO];
    [panel setCanChooseDirectories:YES];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:@[@"png", @"jpeg", @"jpg"]];
    [panel setAllowsOtherFileTypes:YES];
    [panel beginWithCompletionHandler:^(NSModalResponse result) {
        if (result == NSModalResponseOK) {
            NSString *path = panel.URLs.firstObject.path;
            NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
            ScrayBugsDoc *selectDoc = [self selectedBugDoc];
            if (selectDoc) {
                 [self.bugImageView setImage:image];
                selectDoc.fullImage = image;
                selectDoc.thumbImage = image;
                NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectDoc]];
                NSIndexSet *columnSet = [NSIndexSet indexSetWithIndex:0];
                [self.bugTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
                
            }
           
            
        }
        
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


#pragma mark - tableView
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.bugs.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if ([cellView.identifier isEqualToString:@"BugColumn"]) {
        ScrayBugsDoc *bugDoc = [self.bugs objectAtIndex:row];
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    return cellView;
}


- (IBAction)bugTitleDidEndEdit:(NSTextField *)sender {
    ScrayBugsDoc *selectDoc = [self selectedBugDoc];
    if (selectDoc) {
        selectDoc.data.title = [self.bugTextField stringValue];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectDoc]];
        NSIndexSet *columnSet = [NSIndexSet indexSetWithIndex:0];
        [self.bugTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    }
    
}


@end
