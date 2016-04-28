#import <Foundation/Foundation.h>

@interface NItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _price;
    NSDate *_dateCreated;
}

- (void) setItemName: (NSString*) str;
- (NSString*) itemName;

- (void) setSerialNumber: (NSString*) str;
- (NSString*) serialNumber;

- (void) setPrice: (int) v;
- (int) price;

- (NSDate*) dateCreated;

- (instancetype) initWithName: (NSString*) str;

@end
