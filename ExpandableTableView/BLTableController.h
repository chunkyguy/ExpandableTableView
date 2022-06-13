#import <Foundation/Foundation.h>
#import "BLCellItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLTableController : NSObject
- (void)makeRootNodesVisible;
- (NSInteger)visibleItemsInSection:(NSInteger)section;
- (BLCellItem *)cellItemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, readonly) NSInteger sectionCount;
@end

NS_ASSUME_NONNULL_END
