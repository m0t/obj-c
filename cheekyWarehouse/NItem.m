#import "NItem.h"

@implementation NItem

- (instancetype) init
{
    self = [super init];
    _dateCreated = [[NSDate alloc] init];
    return self;
}

- (instancetype) initWithName:(NSString *)str
{
    self = [super init];
    [self setItemName: str];
    _dateCreated = [[NSDate alloc] init];
    return self;
}

- (void) setItemName: (NSString*) str
{
    _itemName = str;
}
- (NSString*) itemName
{
    return _itemName;
}

- (void) setSerialNumber: (NSString*) str
{
    _serialNumber = str;
}

- (NSString*) serialNumber
{
    return _serialNumber;
}

- (void) setPrice: (int) v
{
    _price = v;
}

- (int) price
{
    return _price;
}

- (NSDate*) dateCreated
{
    return _dateCreated;
}

- (NSString*) description
{
    NSString* descrString = [[NSString alloc] initWithFormat:@" Item name: %@; Serial: %@; Price: $%d; Creation date: %@", [self itemName], [self serialNumber], [self price], [self dateCreated]];
    return descrString;
}
@end
