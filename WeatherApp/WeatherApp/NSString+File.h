//
//  NSString+File.h
//  WeatherApp
//
//  Created by lt on 16/10/20.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 path都为相对路劲
 */

@interface NSString (File)


/**
 拼接沙盒路劲
 --------------------
 /Documents
 /Libarry/Caches
 /Library/Preferences
 /tmp
 --------------------
 @return 拼接好的路劲
 */
- (NSString *)path;


/**
 bundle文件

 @return bundle文件路劲
 */
- (NSString *)bundleFile;


/**
 bundle图片

 @return 图片文件
 */
- (UIImage *)bundleImage;


/**
 检测文件是否存在

 @return 是否存才
 */
- (BOOL)exist;


/**
 创建文件夹

 @return 创建文件夹
 */
- (BOOL)createFolder;

/**
 *  是否是文件夹
 *
 *  @return 是否是文件夹
 */
- (BOOL)isDirectory;

/**
 *  复制到这个路径
 *
 *  @param path 相对路径
 *
 *  @return 是否成功
 */
- (BOOL)copyTo:(NSString *)path;

/**
 *  移动到这个路径
 *
 *  @param path 路径
 *
 *  @return 是否成功
 */
- (BOOL)moveTo:(NSString *)path;

/**
 *  删除文件
 *
 *  @return 是否成功
 */
- (BOOL)remove;

/**
 *  遍历出文件夹中的文件
 *
 *  @return 文件夹的内容
 */
- (NSArray *)enumeratorFolder;

/**
 *  遍历出文件夹并在block中查看
 *
 *  @param block 数组中遍历出路径
 */
- (void)enumeratorFolderEach:(void (^)(NSString *path))block;

/**
 *  文件信息
 *
 *  @return 文件描述的字典信息
 */
- (NSDictionary *)fileInfo;

/**
 *  文件大小
 *
 *  @return 文件大小
 */
- (int)fileSize;

@end
