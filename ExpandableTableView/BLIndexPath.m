#import "BLIndexPath.h"
#import <UIKit/UIKit.h>

@implementation BLIndexPath
{
  NSIndexPath *_indexPath;
}

+ (instancetype)indexPathForRow:(NSInteger)row inSection:(NSInteger)section level:(NSInteger)level;
{
  return [[[self class] alloc] initWithRow:row inSection:section level:level];
}

- (instancetype)initWithRow:(NSInteger)row inSection:(NSInteger)section level:(NSInteger)level;
{
  self = [super init];
  if (!self) {
    return nil;
  }
  _indexPath = [[NSIndexPath indexPathForRow:row inSection:section] indexPathByAddingIndex:level];
  return self;
}

- (NSIndexPath *)indexPath
{
  return [_indexPath indexPathByRemovingLastIndex];
}

- (NSInteger)row {
  return self.indexPath.row;
}

- (NSInteger)section {
  return self.indexPath.section;
}

- (NSInteger)level {
  return [_indexPath indexAtPosition:2];
}

#pragma mark - NSCopying

- (id)copyWithZone:(nullable NSZone *)zone;
{
  return [[BLIndexPath alloc] initWithRow:self.row inSection:self.section level:self.level];
}

@end
