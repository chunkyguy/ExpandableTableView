#import "ViewController.h"
#import "BLTableController.h"
#import "BLCellItem.h"

NSString *const kCellIdentifier = @"CellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
  BLTableController *_controller;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  _controller = [[BLTableController alloc] init];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Exandable Table View";

  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];

  // Set root nodes to be visible
  [_controller makeRootNodesVisible];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return _controller.sectionCount;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_controller visibleItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];

  BLCellItem *item = [_controller cellItemAtIndexPath:indexPath];
  cell.textLabel.text = item.title;

  return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  BLCellItem *item = [_controller cellItemAtIndexPath:indexPath];
  BOOL oldChildrenVisible = item.childrenVisible;

  NSMutableArray *insertions = [NSMutableArray array];
  NSMutableArray *deletions = [NSMutableArray array];

  if (oldChildrenVisible) {
    NSInteger count = 0;
    [item hideChildrenCount:&count];
    for (NSInteger offset = 0; offset < count; ++offset) {
      [deletions addObject:[NSIndexPath indexPathForRow:indexPath.row + offset + 1
                                              inSection:indexPath.section]];
    }
  } else {
    [item showChildren];
    for (NSUInteger offset = 0; offset < item.children.count; ++offset) {
      [insertions addObject:[NSIndexPath indexPathForRow:indexPath.row + offset + 1
                                               inSection:indexPath.section]];
    }
  }

  [tableView beginUpdates];
  [tableView deleteRowsAtIndexPaths:deletions withRowAnimation:UITableViewRowAnimationFade];
  [tableView insertRowsAtIndexPaths:insertions withRowAnimation:UITableViewRowAnimationFade];
  [tableView endUpdates];

  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
