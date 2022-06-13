#import <UIKit/UIKit.h>
#import "BLSettingSelectionDiffer.h"
#import "BLIndexPath.h"

@implementation BLSettingSelectionDiffer {
  NSArray *_lastInsertIndices;
}

- (NSArray *)insertPathForSelection:(NSIndexPath *)indexPath
                                 offset:(NSInteger)offset
                                  level:(NSInteger)level
{
  BLIndexPath *insertIndexPath = [BLIndexPath indexPathForRow:indexPath.row + offset inSection:0 level:level];
  _lastInsertIndices = @[insertIndexPath];
  return @[insertIndexPath];
}

- (NSArray *)deleteLastSelectedPath
{
  NSArray *deleteIndexPath = [_lastInsertIndices copy];
  _lastInsertIndices = nil;
  return deleteIndexPath;
}

@end
