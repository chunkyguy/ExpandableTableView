#import "BLSettingSelectionDifferIndices.h"
#import <UIKit/UIKit.h>

@implementation BLSettingSelectionDifferIndices {
  NSMutableArray *_insertionsList;
  NSMutableArray *_deletionsList;
}

- (instancetype)init
{
  self = [super init];
  if (!self) {
    return nil;
  }
  _insertionsList = [NSMutableArray array];
  _deletionsList = [NSMutableArray array];
  return self;
}

- (void)insertIndexPath:(NSIndexPath *)indexPath;
{
  [_insertionsList addObject:indexPath];
}

- (void)deleteIndexPath:(NSIndexPath *)indexPath;
{
  [_deletionsList addObject:indexPath];
}

- (NSArray *)insertions
{
  return [_insertionsList copy];
}

- (NSArray *)deletions {
  return [_deletionsList copy];
}

- (NSString *)description
{
  NSMutableString *str = [NSMutableString string];
  [str appendString:@"\nDelete:\n"];
  for (NSIndexPath *ip in _deletionsList) {
    [str appendFormat:@"{%ld, %ld}, ", ip.section, ip.row];
  }
  [str appendString:@"\nInsert:\n"];
  for (NSIndexPath *ip in _insertionsList) {
    [str appendFormat:@"{%ld, %ld}, ", ip.section, ip.row];
  }
  return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, str];
}
@end
