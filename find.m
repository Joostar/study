//
//  main.m
//  ClientOSBuyShopping
//
//  Created by 孙燕飞 on 2017/2/11.
//  Copyright © 2017年 Gome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#pragma mark 顺序查找，时间复杂度O(n)
int SequenceSearch(int a[],int n,int value)
{
    int res = -1;
    for(int i = 0;i < n;i++)
    {
        if(a[i] == value)
        {
            res = i;
            break;
        }
    }
    return res;
}

#pragma mark 折半查找（二分查找），前提必须是有序的。时间复杂度O(log2N)
int BinarySearch1(int a[],int n,int value)
{
    int low = 0;
    int high = n;
    int mid = 0;
    int res = -1;
    while (low <= high)
    {
        mid = (low + high) / 2;
        if(a[mid] == value)
        {
            res = mid;
            break;
        }
        else if (a[mid] < value)
        {
            low = mid + 1;
        }
        else
        {
            high = mid - 1;
        }
    }
    return res;
}

int BinarySearch2(int a[],int n,int value,int low,int high)
{
    if(low > high)
    {
        return -1;
    }
    int mid = (high + low) / 2;
    if(a[mid] == value) return mid;
    else if (a[mid] > value) return BinarySearch2(a, n, value,low,mid - 1);
    else return BinarySearch2(a, n, value,mid + 1,high);
}



int main(int argc, char * argv[]) {
    
    const int i = 100;
    int a[i];
    for(int j = 0;j < i;j++)
    {
        a[j] = j;
    }
    
    for(int j = 0;j < 20;j++)
    {
        int value = random() % i + 1;
        value = 1111;
        int res = BinarySearch2(a, i, value,0,i);
        NSLog(@"%d  %d",value,res);
    }
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
