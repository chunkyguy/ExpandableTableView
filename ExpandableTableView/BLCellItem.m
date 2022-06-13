#import "BLCellItem.h"

@implementation BLCellItem
+ (instancetype)itemWithTitle:(NSString *)title;
{
  return [[[self class] alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title;
{
  self = [super init];
  if (!self) {
    return nil;
  }

  _title = [title copy];
  _level = 0;
  _visible = NO;
  _children = [NSMutableArray array];

  return self;
}

- (void)addChild:(BLCellItem *)child
{
  [self addChildren:@[child]];
}

- (void)addChildren:(NSArray *)children {
  for (BLCellItem *child in children) {
    child.level = _level + 1;
  }
  [_children addObjectsFromArray:children];
}

- (void)visibleCount:(NSInteger *)counter
{
  if (_visible) {
    *counter = (*counter) + 1;
  }
  for (BLCellItem *child in _children) {
    [child visibleCount:counter];
  }
}

- (void)fillVisible:(NSMutableArray *)items
{
  if (_visible) {
    [items addObject:self];
  }
  for (BLCellItem *child in _children) {
    [child fillVisible:items];
  }
}

- (BOOL)childrenVisible
{
  if (!_visible) {
    return NO;
  }

  for (BLCellItem *child in _children) {
    if (!child.visible) {
      return NO;
    }
  }

  return YES;
}

- (void)showChildren
{
  for (BLCellItem *child in _children) {
    child.visible = YES;
  }
}

- (void)hideChildrenCount:(NSInteger *)count;
{
  if (![self childrenVisible]) {
    return;
  }
  *count = (*count) + _children.count;
  for (BLCellItem *child in _children) {
    [child hideChildrenCount:count];
    child.visible = NO;
  }
}

@end
