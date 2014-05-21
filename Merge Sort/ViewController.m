//
//  ViewController.m
//  Merge Sort
//
//  Created by Daniel Fairbanks on 5/21/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSMutableArray *unsortedArray = [NSMutableArray new];
    [unsortedArray addObject:[NSNumber numberWithInt:1]];
    [unsortedArray addObject:[NSNumber numberWithInt:7]];
    [unsortedArray addObject:[NSNumber numberWithInt:19]];
    [unsortedArray addObject:[NSNumber numberWithInt:3]];
    [unsortedArray addObject:[NSNumber numberWithInt:42]];
    [unsortedArray addObject:[NSNumber numberWithInt:12]];
    [unsortedArray addObject:[NSNumber numberWithInt:6]];
    [unsortedArray addObject:[NSNumber numberWithInt:18]];
    [unsortedArray addObject:[NSNumber numberWithInt:21]];
    [unsortedArray addObject:[NSNumber numberWithInt:22]];
    [unsortedArray addObject:[NSNumber numberWithInt:2]];
    [unsortedArray addObject:[NSNumber numberWithInt:11]];
    
    NSLog(@"%@", unsortedArray);
    
    [self mergeSort:unsortedArray];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if ([unsortedArray count] < 2)
    {
        return unsortedArray;
    }
    long middle = ([unsortedArray count]/2);
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, ([unsortedArray count] - middle));
    NSArray *rightArr = [unsortedArray subarrayWithRange:right];
    NSArray *leftArr = [unsortedArray subarrayWithRange:left];
    //Or iterate through the unsortedArray and create your left and right array
    //for left array iteration starts at index =0 and stops at middle, for right array iteration starts at midde and end at the end of the unsorted array
    NSArray *resultArray =[self merge:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
    
    NSLog(@"%@", resultArray);
    return resultArray;
    
    
}

-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count])
    {
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue])
        {
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else
        {
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
    
    
}

@end
