//
//  ViewController.m
//  CommsExample
//
//  Created by A4-iMAC01 on 27/10/2020.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)btn:(id)sender {
    NSString * urlString = @"https://escuelaestech.es";
    NSURL * url = [NSURL URLWithString:urlString];
    
    [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url2 = [NSURL URLWithString:@"https://qastusoft.com.es/apis/login.php?user=user1&pass=user1."];
    NSURLSessionDataTask * task = [session dataTaskWithURL:url2 completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
        NSLog(@"%@",response);
        NSLog(@"%@",error);
    }];
    [task resume];
    
    NSURLSession *session2 = [NSURLSession sharedSession];
    NSURL * url3= [NSURL URLWithString:@"https://qastusoft.com.es/apis/login.php"];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url3];
    request.HTTPMethod = @"POST";
    
    request.HTTPBody =[@"user=user1&pass=user1" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask * task2 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    NSData * imageData =[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://brandemia.org/sites/default/files/inline/images/logo_android_despues.jpg"]];
    _imageView.image = [UIImage imageWithData:imageData];
}


@end
