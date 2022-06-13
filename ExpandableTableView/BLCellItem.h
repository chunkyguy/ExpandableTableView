#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLCellItem : NSObject
+ (instancetype)itemWithTitle:(NSString *)title;

- (void)addChild:(BLCellItem *)child;
- (void)addChildren:(NSArray *)children;

// Read data
- (void)visibleCount:(NSInteger *)counter;
- (void)fillVisible:(NSMutableArray *)items;

- (void)showChildren;
- (void)hideChildrenCount:(NSInteger *)count;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, copy) NSMutableArray *children;
@property (nonatomic, assign) BOOL visible;
@property (nonatomic, readonly) BOOL childrenVisible;
@end

NS_ASSUME_NONNULL_END
