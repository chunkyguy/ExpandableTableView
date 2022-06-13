#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLSettingSelectionDifferIndices : NSObject

- (void)insertIndexPath:(NSIndexPath *)indexPath;
- (void)deleteIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, readonly) NSArray *insertions;
@property (nonatomic, readonly) NSArray *deletions;

@end

NS_ASSUME_NONNULL_END
