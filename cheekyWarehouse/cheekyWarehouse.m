#import <Foundation/Foundation.h>
#import "NItem.h"

void print_items(NSMutableArray* items){
    if ( [items count] > 0){
        NSLog(@"You now have %lu shitty item(s)", [items count]);
        for (NItem* item in items){
            NSLog(@"Index %lu : %@", (unsigned long)[items indexOfObject: item], item);
        }
    }
    else {
        NSLog(@"There's no items here, you dumb fuck!");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
        char choice;
        
        while (true){
            NSLog(@"Do you want to create items? (y/n)");
            
            choice = (char) getchar();
            getchar();
            if ( choice == 'y' || choice == 'Y'){
                NSLog(@"hurry up then");
                NItem *nitem = [[NItem alloc] init];
                
                while (true){
                    NSLog(@"Item name?");
                    NSData *data = [input availableData];
                    NSString *tempStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    tempStr = [tempStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
                    //NSLog(@"%@", name);
                    [nitem setItemName: tempStr];
                    
                    NSLog(@"Item Serial Number?");
                    data = [input availableData];
                    tempStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    tempStr = [tempStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
                    [nitem setSerialNumber: tempStr];
                    
                    NSLog(@"Item price?");
                    data = [input availableData];
                    tempStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    [nitem setPrice:[tempStr intValue]];
                    
                    [items addObject: nitem];
                    NSLog(@"You now have %lu shitty item(s)", [items count]);
                    
                    NSLog(@"Want more? (y/n)");
                    choice = (char) getchar();
                    getchar();
                    if ( !( choice == 'y' || choice == 'Y') )
                        break;
                    
                }
            }
            else{
                NSLog(@"then do you want to see your items? (y/n)");
                choice = (char) getchar();
                getchar();
                if ( choice == 'y' || choice == 'Y')
                    print_items(items);
                else {
                    NSLog(@"then fuck you");
                    break;
                }
            }
        }
    }
    return 0;
}
