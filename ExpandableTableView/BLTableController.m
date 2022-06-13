#import "BLTableController.h"
#import <UIKit/UIKit.h>

@implementation BLTableController
{
  NSArray *_sections;
}

- (instancetype)init
{
  self = [super init];
  if (!self) {
    return nil;
  }

  BLCellItem *first = [BLCellItem itemWithTitle:@"1."];
  BLCellItem *firstDetails = [BLCellItem itemWithTitle:@"\t1.1."];

  BLCellItem *second = [BLCellItem itemWithTitle:@"2."];
  BLCellItem *secondDetails = [BLCellItem itemWithTitle:@"\t2.1."];

  BLCellItem *third = [BLCellItem itemWithTitle:@"3."];
  BLCellItem *thirdGroupOne = [BLCellItem itemWithTitle:@"\t3.1."];
  BLCellItem *thirdGroupOneDetails = [BLCellItem itemWithTitle:@"\t\t3.1.1."];
  BLCellItem *thirdGroupTwo = [BLCellItem itemWithTitle:@"\t3.2."];
  BLCellItem *thirdGroupTwoDetails = [BLCellItem itemWithTitle:@"\t\t3.2.1."];

  BLCellItem *fourth = [BLCellItem itemWithTitle:@"4."];
  BLCellItem *fourthGroupOne = [BLCellItem itemWithTitle:@"\t4.1."];
  BLCellItem *fourthGroupOneDetails = [BLCellItem itemWithTitle:@"\t\t4.1.1."];
  BLCellItem *fourthGroupTwo = [BLCellItem itemWithTitle:@"\t4.2."];
  BLCellItem *fourthGroupTwoDetails = [BLCellItem itemWithTitle:@"\t\t4.2.1."];

  NSMutableArray *firstSection = [NSMutableArray arrayWithArray:@[first, second]];
  NSMutableArray *secondSection = [NSMutableArray arrayWithArray:@[third, fourth]];

  [first addChild:firstDetails];
  [second addChild:secondDetails];

  [third addChildren:@[thirdGroupOne, thirdGroupTwo]];
  [thirdGroupOne addChild:thirdGroupOneDetails];
  [thirdGroupTwo addChild:thirdGroupTwoDetails];

  [fourth addChildren:@[fourthGroupOne, fourthGroupTwo]];
  [fourthGroupOne addChild:fourthGroupOneDetails];
  [fourthGroupTwo addChild:fourthGroupTwoDetails];

  _sections = @[firstSection, secondSection];

  return self;
}

- (void)makeRootNodesVisible
{
  for (NSArray *section in _sections) {
    for (BLCellItem *item in section) {
      item.visible = YES;
    }
  }
}

- (NSInteger)sectionCount
{
  return _sections.count;
}

- (NSInteger)visibleItemsInSection:(NSInteger)section
{
  NSInteger count = 0;
  for (BLCellItem *item in _sections[section]) {
    [item visibleCount:&count];
  }
  return count;
}

- (BLCellItem *)cellItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSMutableArray *visibleItems = [NSMutableArray array];
  for (BLCellItem *item in _sections[indexPath.section]) {
    [item fillVisible:visibleItems];
  }
  return [visibleItems objectAtIndex:indexPath.row];
}
@end
