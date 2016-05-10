//
//  main.m
//  SetIntersection


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"1;4,5,6";
        NSArray *semicolonSeperated = [line componentsSeparatedByString:@";"];
        NSMutableString *solutionMutString = [[NSMutableString alloc]init];
        
        // seperate each string in array
        NSArray *firstStringSeperated = [[semicolonSeperated objectAtIndex:0] componentsSeparatedByString:@","];
        NSArray *secondStringSeperated = [[semicolonSeperated objectAtIndex:1] componentsSeparatedByString:@","];
        
        NSLog(@"\nfirstStringSeperated:%@\n\nsecondStringSeperated:%@", firstStringSeperated, secondStringSeperated);
        
        // find smaller array to loop through
        NSMutableArray *smallerMutArray = [[NSMutableArray alloc]init];
        NSMutableArray *largerMutArray = [[NSMutableArray alloc]init];
        
        if (firstStringSeperated.count < secondStringSeperated.count) {
            smallerMutArray = [firstStringSeperated mutableCopy];
            largerMutArray = [secondStringSeperated mutableCopy];
            
        }
        else {
            smallerMutArray = [secondStringSeperated mutableCopy];
            largerMutArray = [firstStringSeperated mutableCopy];
        }
        
        // check for intersections
        NSInteger i = 0;
        NSInteger k = 0;
        for (i = 0; i < smallerMutArray.count; i++) {
            NSString *numStringAtI = [smallerMutArray objectAtIndex:i];
            for (k = 0; k <largerMutArray.count; k++) {
                if ([largerMutArray containsObject: numStringAtI]) {
                    // add to solution array
                    [solutionMutString appendFormat:@"%@,", numStringAtI];
                    break;
                }
            }
        }
        
        // check for zero intersection
        if (solutionMutString.length > 0) {
            NSRange lastCommaRange = NSMakeRange(solutionMutString.length - 1, 1);
            [solutionMutString deleteCharactersInRange:lastCommaRange];
            NSLog(@"solutionMutString:%@", solutionMutString);
        }
        else {
            NSLog(@"Nope\n");
        }
        
        
    }
    return 0;
}
